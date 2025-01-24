

import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_buttons.dart';
import 'package:projectmana_pupbili/components/my_text_field.dart';
import 'package:projectmana_pupbili/services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;

  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();


  void register() async {
    //get auth service
    final _authService = AuthService();



  if (passwordController.text == confirmPasswordController.text) {
    // try creating user
    try {
      await _authService.signUpWithEmailPassword(emailController.text, passwordController.text);
     }
     //display any errors
    catch (e) {
      showDialog(
          context: context, 
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          )
      );
    }
   }

  //password dont match
  else {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
          title: Text("Password don't match!"),
        )
    );
  }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Logo
            Image.asset(
              'lib/images/logo/pubili.png',
              height: 100,  // Adjust size
              width: 100,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 25),

            //Title or Slogan
            Text("Welcome PUPIAN!",
              style: TextStyle(
                fontSize: 16,
                color: Theme
                    .of(context)
                    .colorScheme
                    .inversePrimary,
              ),
            ),

            const SizedBox(height: 25),

            //Email
            MyTextField(
              controller: emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //Password
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),

            //Confirm Password
            MyTextField(
                controller: confirmPasswordController,
                hintText: "Confirm password",
                obscureText: true),

            const SizedBox(height: 10),

            //Sign Up Button
            MyButton(
              text: "Sign Up",
              onTap: register,
            ),

            const SizedBox(height: 25),

            //already have an account? login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme
                        .of(context)
                        .colorScheme
                        .inversePrimary,
                  ),
                ),
                const SizedBox(width: 4,),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login here",
                    style: TextStyle(
                      color: Theme
                          .of(context)
                          .colorScheme
                          .inversePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            )


            //Not Registered? Register Now
          ],
        ),
      ),
    );
  }
}