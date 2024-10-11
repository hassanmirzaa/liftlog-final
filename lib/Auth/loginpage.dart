import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liftlog/Auth/signupscreen.dart';
import 'package:liftlog/NavBar/navbar.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';
import 'package:liftlog/Widgets/custom_textfield.dart';
import 'package:liftlog/Widgets/square_button.dart';
import 'package:liftlog/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final EmailController = TextEditingController();
  final PswdController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    EmailController.dispose();
    PswdController.dispose();
    super.dispose();
  }

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PswdController.text.trim(),
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedin', true);

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const CustomNavBar(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      if (e.code == 'wrong-password') {
        message = 'Wrong password provided.';
      } else if (e.code == 'user-not-found') {
        message = 'No user found for that email.';
      } else {
        message = 'An error occurred. Please try again later.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> resetPassword() async {
    if (EmailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please enter your email to reset password.')));
      return;
    }
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: EmailController.text.trim());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password reset link sent to your email.')));
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${e.message}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: AppColor.ThemeColor,
                ),
              ),
              const CustomSizedBox(x: 0.05),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: EmailController,
                      hintText: "Email Address",
                      obscure: false,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                    ),
                    const CustomSizedBox(x: 0.02),
                    CustomTextField(
                      controller: PswdController,
                      hintText: "Password",
                      obscure: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const CustomSizedBox(x: 0.02),
              _isLoading
                  ? const CircularProgressIndicator()
                  : SquareButton(
                      heading: 'Login',
                      widthSize: 0.3,
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          login();
                        }
                      },
                      heightSize: 0.1,
                    ),
              const CustomSizedBox(x: 0.02),
              TextButton(
                onPressed: resetPassword,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: AppColor.ThemeColor),
                ),
              ),
              const CustomSizedBox(x: 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(color: AppColor.ThemeColor),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      ' Register',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
