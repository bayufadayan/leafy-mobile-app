// ignore_for_file: avoid_print

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../firebase_options.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message ${message.messageId}');
}

class NotificationService {
  static late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  static late AndroidNotificationChannel channel;
  static bool isFlutterLocalNotificationsInitialized = false;
  final FirebaseDatabase _database = FirebaseDatabase.instance;

  Future<void> initNotifications() async {
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(showFlutterNotification);
    if (!kIsWeb) {
      await setupFlutterNotifications();
    }

    await _saveFcmToken();
  }

  Future<String?> getToken() async {
    try {
      final token = await FirebaseMessaging.instance.getToken(
          vapidKey:
              'BNKkaUWxyP_yC_lki1kYazgca0TNhuzt2drsOrL6WrgGbqnMnr8ZMLzg_rSPDm6HKphABS0KzjPfSqCXHXEd06Y');

      print('FCM Token: $token');
      return token;
    } catch (e, s) {
      debugPrint('Failed to get FCM token: $e');
      debugPrintStack(stackTrace: s);
      return null;
    }
  }

  Future<void> _saveFcmToken() async {
    String? token = await getToken();
    if (token != null) {
      // Menyimpan token ke Firebase Realtime Database
      // Misalnya menyimpan dengan path '/fcmTokens/{deviceId}'
      // Anda bisa menggunakan userId atau deviceId yang unik
      DatabaseReference tokenRef = _database.ref('/fcmTokens/$token');
      await tokenRef.set({
        'token': token,
        'timestamp': ServerValue.timestamp,
      });
      print("FCM Token has been saved to Realtime Database");
    }
  }

  Future<void> setupFlutterNotifications() async {
    if (isFlutterLocalNotificationsInitialized) {
      return;
    }
    channel = const AndroidNotificationChannel(
      'high_importance_channel',
      'High Importance Notifications',
      description: 'This channel is used for important notifications.',
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }

  void showFlutterNotification(RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    AndroidNotification? android = message.notification?.android;
    if (notification != null && android != null && !kIsWeb) {
      flutterLocalNotificationsPlugin.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,
            channelDescription: channel.description,
            icon: 'notif_icon',
            priority: Priority.high,
            importance: Importance.high,
          ),
        ),
      );
    }
  }
}
