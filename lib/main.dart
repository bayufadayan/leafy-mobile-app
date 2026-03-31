import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iot_app/screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:iot_app/services/notification_service/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'utils/google_fonts_compat.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (await Permission.notification.request().isGranted) {
    await NotificationService().initNotifications();
    await NotificationService().getToken();
  }


  runApp(const MyApp());
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
