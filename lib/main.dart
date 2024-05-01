//import 'package:firebase_core/firebase_core.dart';
// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hrt_kozanis/controllers/user_controller.dart';
import 'package:hrt_kozanis/firebase_options.dart';
import 'package:hrt_kozanis/screens/login_screen.dart';
import 'package:hrt_kozanis/screens/main_screen.dart';

import 'bottom_nav_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  final user = await UserController.loginWithGoogle();
  (user != null) ? runApp(const MainScreen()) : runApp(const LoginScreen());
}
