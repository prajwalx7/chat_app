import 'package:chat_app/screens/home/view/home_screen.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up"),
            ElevatedButton(
              onPressed: () async {
                final autheService = AutheService();
                final userCredential = await autheService.signInWithGoogle();
                if (userCredential != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                }
              },
              child: Text("Sign in with Google"),
            ),
          ],
        ),
      ),
    );
  }
}
