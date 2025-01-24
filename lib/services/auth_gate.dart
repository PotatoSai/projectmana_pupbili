import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/pages/home_page.dart';
import 'package:projectmana_pupbili/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            //user is logged in
            if (snapshot.hasData){
              return const HomePage();
            }

            //user is NOT logged
            else {
              return const LoginOrRegister();
            }
          },
      ),
    );
  }
}
