import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liftlog/Auth/loginpage.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';
import 'package:liftlog/Widgets/custom_textfield.dart';
import 'package:liftlog/Widgets/square_button.dart';
import 'package:liftlog/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController EmailController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController PswdController = TextEditingController();
  final TextEditingController HeightController = TextEditingController();
  final TextEditingController WeightController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  @override
  void dispose() {
    EmailController.dispose();
    NameController.dispose();
    PswdController.dispose();
    HeightController.dispose();
    WeightController.dispose();
    super.dispose();
  }

  Future<void> signUp() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: EmailController.text.trim(),
        password: PswdController.text.trim(),
      );

      // Update the user information
      await userCredential.user?.updateDisplayName(NameController.text.trim());

      // Navigate to login screen after successful sign-up
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      String message;
      switch (e.code) {
        case 'weak-password':
          message = 'The password provided is too weak.';
          break;
        case 'email-already-in-use':
          message = 'The account already exists for that email.';
          break;
        default:
          message = 'An error occurred. Please try again later.';
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Registration",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: AppColor.ThemeColor)),
                const CustomSizedBox(x: 0.02),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: NameController,
                        hintText: "Full Name",
                        obscure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const CustomSizedBox(x: 0.02),
                      CustomTextField(
                        controller: EmailController,
                        hintText: "Email Address",
                        obscure: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const CustomSizedBox(x: 0.02),
                      CustomTextField(
                        controller: HeightController,
                        hintText: "Height in ft",
                        obscure: false,
                      ),
                      const CustomSizedBox(x: 0.02),
                      CustomTextField(
                        controller: WeightController,
                        hintText: "Weight in Kgs",
                        obscure: false,
                      ),
                      const CustomSizedBox(x: 0.02),
                      CustomTextField(
                        controller: PswdController,
                        hintText: "Password",
                        obscure: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                      const CustomSizedBox(x: 0.03),
                      _isLoading
                          // ignore: prefer_const_constructors
                          ? CircularProgressIndicator(backgroundColor: AppColor.ThemeColor,)
                          : SquareButton(
                              widthSize: 0.3,
                              heading: "Register",
                              onPress: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  signUp();
                                }
                              },
                              heightSize: 0.1,
                            )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
