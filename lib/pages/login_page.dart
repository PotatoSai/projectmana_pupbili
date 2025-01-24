import 'package:flutter/material.dart';
import 'package:projectmana_pupbili/components/app_buttons.dart';
import 'package:projectmana_pupbili/components/my_text_field.dart';
import 'package:projectmana_pupbili/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // login page method


  void login() async {
    // get instance of auth service
    final _authService = AuthService();

    //try sign in
    try {
      await _authService.signInWithEmailPassword(emailController.text, passwordController.text);
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

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
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
            Text("Tara, Kain!",
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
                obscureText: false,
            ),

            const SizedBox(height: 10),

            //Password
            MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true),

            const SizedBox(height: 10),
            //Sign In Button

            MyButton(
                text: "Sign In",
                onTap: login,
            ),

            const SizedBox(height: 25),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not Registered?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(width: 4,),

                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
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
