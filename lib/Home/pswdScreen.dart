import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:liftlog/Colors.dart';
import 'package:liftlog/Home/Split.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      appBar: AppBar(
        title: const Text("Enter Password"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: height * 0.25,
              width: height *
                  0.25, // Keep height and width equal for a perfect circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor
                    .ThemeColor, // Optional: background color in case the image does not load
              ),
              child: ClipOval(
                // Use ClipOval to ensure the image fits in a circle
                child: Image.asset(
                  'assets/images/abbas.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity, // Ensure the image fills the circle
                ),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: width * 0.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: AppColor.ThemeColor, width: 0.4)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: TextField(
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: AppColor.SelectedColor,
                        filled: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(color: AppColor.ThemeColor),
                      ),
                      style: TextStyle(
                          color: AppColor
                              .ThemeColor), // Set the text color to ThemeColor
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.05,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SplitScreen(),));
                  },
                  child: Container(
                    width: width * 0.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.ThemeColor,
                    ),
                    child:  Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:Icon(AntDesign.arrow_right_outline,color: AppColor.PrimaryColor,)
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
