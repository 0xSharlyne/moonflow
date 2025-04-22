//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:navigation/auth/auth_services.dart';
import '../components/textfield.dart';
import '../components/button.dart';
//import '../components/square_tile.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key, required this.onTap});

  // email and pw text controllers
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();

  // tap to go to registration page
  final void Function()? onTap;

  // login
  void register(BuildContext context) {
    // get auth service
    final _auth = AuthServices();

   // if password match then create user
    if (_passwordController.text == _confirmPasswordController.text) {

      try {
         _auth.signUpWithEmailPassword(
         _emailController.text,
         _passwordController.text,
        );
      } catch (e) {
        showDialog( //box showing what error is
          context: context, 
          builder: (context) => AlertDialog(
              title: Text(e.toString()),
          ),
        );
      }
    }

    //passwords don't match => tell user to adjust
    else {
      showDialog( 
          context: context, 
          builder: (context) => AlertDialog(
              title: Text("passwords don't match"),
          ),
        );
    }
  }

  //login
  /*void loginUser() async {
    // show loading circle
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!mounted) return;
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (!mounted) return;

      Navigator.pop(context);
      showErrorDialog(e);
    }
  }

  void showErrorDialog(FirebaseAuthException e) {
    String message;

    switch (e.code) {
      case 'user-not-found':
        message = 'Diese E-Mail-Adresse ist nicht registriert.';
        break;
      case 'wrong-password':
        message = 'Das Passwort ist ungültig.';
        break;
      case 'invalid-email':
        message = 'Die E-Mail-Adresse ist ungültig.';
        break;
      default:
        message = e.message ?? 'Ein unbekannter Fehler ist aufgetreten.';
    }
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Anmeldefehler'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* ClipOval(
              child: Image.asset(
                '../../assets/profilLogo.png',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            */
            const SizedBox(height: 20),
            Text(
              'Let´s create an account for you',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Color(0xFF7E57C2),
              ),
            ),

            const SizedBox(height: 20),

            MyTexField(
              controller: _emailController,
              hintText: 'email',
              obscureText: false,
            ),

            const SizedBox(height: 20),

            MyTexField(
              controller: _passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            MyTexField(
              controller: _confirmPasswordController,
              hintText: 'confirm Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Passwort vergessen?',
                    style: TextStyle(color: Color(0xFFC64995)),
                  ),
                ],
              ),
            ),*/
            const SizedBox(height: 25),

            MyButton(
              text: "Register",
              onTap: () => register(context), //loginUser
            ),

            const SizedBox(height: 35),

            /*Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[400]),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'Oder weiter mit',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 0.5, color: Colors.grey[400]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const[
                SquareTile(imagePath: 'assets/images/google_logo.png'),

                SizedBox(width: 10,),

                SquareTile(imagePath: 'assets/images/apple_logo.png'),

              ],
            ),
            const SizedBox(height: 20,),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Schon Mitglied?',
                  style: TextStyle(color: Colors.grey[700]),
                ),

                const SizedBox(width: 4),

                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'Jetzt Einlogen',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
