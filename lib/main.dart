import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_app/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_app/services/notification_service/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'utils/google_fonts_compat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());

  // Do not block app startup on notification initialization.
  final notificationPermission = await Permission.notification.request();
  if (notificationPermission.isGranted) {
    try {
      await NotificationService().initNotifications();
    } catch (e, s) {
      debugPrint('Notification init failed: $e');
      debugPrintStack(stackTrace: s);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.quicksandTextTheme(),
      ),
      title: "Leafy",
      home: const SplashScreen(),
    );
  }
}
