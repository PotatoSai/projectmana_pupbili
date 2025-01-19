import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(height: 25),

            //Title or Slogan
            Text("PUPBILI",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //Email
            MyTextField(
                controller: emailController,
                hintText: "Email",
                obscureText: true,
            ),

            const SizedBox(height: 10),

            //Password
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),


            //Sign In Button

            const SizedBox(height: 10),

            //Not Registered? Register Now
          ],
        ),
      ),
    );
  }
}
