import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:liftlog/Auth/loginpage.dart';
import 'package:liftlog/Colors.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Future<void> _logout() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setBool('isLoggedin', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  bool _isDarkMode = false; // Added state variable for Dark Mode

  @override
  Widget build(BuildContext context) {
  final Height = MediaQuery.of(context).size.height;
  final Width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const CustomSizedBox(x: 0.02), 
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Dark Mode',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        // Added switch for Dark Mode
                        Switch(
                          value: _isDarkMode,
                          onChanged: (value) {
                            setState(() {
                              _isDarkMode = value;
                            });
                            // Code to handle dark mode switching will go here
                          },
                          activeColor: Colors.blue, // iOS style switch color
                        ),
                      ],
                    ),
                  ),
                ),
                const CustomSizedBox(x: 0.02),
        
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: Height*0.3,
                      width: Width*0.43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child: const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("About Developer",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                            Text("Hassan mirza, A Developer of this app is a certified personal trainer itself who has transformed his 100+ clients worldwide by his science based techniques and nutritional experties",
                            style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )),
                    ),
                    Container(
                      height: Height*0.3,
                      width: Width*0.43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                       child: const Center(child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Why Choose Us?",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600
                              ),
                              ),
                            ),
                            Text("We are the platform that provides you custom calculated workout routines and plans to achieve your goals according to your availability for getting your  desired results",
                            style: TextStyle(fontSize: 15),
                            )
                          ],
                        ),
                      )),
                    ),
                    
                  ],
                ),
                CustomSizedBox(x: 0.02),
                Container(
                      //height: Height*0.3,
                     // width: Width*0.43,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                      ),
                      child:const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(16.0),
                                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Pricing",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600
                                    ),
                                    ),
                                    Text("Rs.5557/month",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600
                                    ),
                                    ),
                                  ],
                                ),
                              ),
                              Text("We provide workout plans for every indivisual according to their goals and avaialibility, Workout routine of whole week and exercises for every session will will be updated by every Sunday, If you don't get your desired results, we will change a plan , Its our responsibilty to transform yourself, Moreover 24/7 chat support on whatsapp for every indivisual, if you are suffering from form of exercise you are performing, We got you, We included mini tutorials of every exercise with a perfect form, moreover you can send a video of your form and get  feedback unlimited times",
                              style: TextStyle(fontSize: 15),
                              )
                            ],
                          ),
                      ),
                    ),
                    CustomSizedBox(x: 0.02),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: GestureDetector(
                    onTap: _logout,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      //width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            EvaIcons.log_out,
                            color: Colors.black,
                            size: MediaQuery.of(context).size.height * 0.08,
                          ),
                          Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 29,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomSizedBox(x: 0.15)
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
