import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hrt_kozanis/controllers/user_controller.dart';
import 'package:hrt_kozanis/screens/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height: 200.0,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      try {
                        final user = await UserController.loginWithGoogle();
                        if (user != null && mounted) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const MainScreen()));
                        }
                      } on FirebaseAuthException catch (error) {
                        debugPrint(error.message);
                      } catch (error) {
                        debugPrint(error.toString());
                      }
                    },
                    child: const Text('Σύνδεση'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
