import 'package:flutter/material.dart';
import 'package:liftlog/Colors.dart';
import 'package:liftlog/Home/exercises.dart';
import 'package:liftlog/Home/pswdScreen.dart';

class SplitScreen extends StatefulWidget {
  const SplitScreen({super.key});

  @override
  State<SplitScreen> createState() => _SplitScreenState();
}

class _SplitScreenState extends State<SplitScreen> {
  @override
  Widget build(BuildContext context) {
    
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Column(
          children: [
             Container(
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(240)),
                      color: AppColor.ThemeColor),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Your Weekly Split",
                      style: TextStyle(color: AppColor.PrimaryColor, fontSize: 25),
                    ),
                  ),
                ),
           Expanded(
             child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 1.0,
                        mainAxisSpacing: 1.0,
                      ),
                      itemCount: split.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: GestureDetector(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => ExercisesScreen(),));;
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.SelectedColor,
                                  border: Border.all(
                                      color: AppColor.ThemeColor, width: 2)),
                             child:Center(child: Padding(
                               padding: const EdgeInsets.all(4.0),
                               child: Column(mainAxisAlignment: MainAxisAlignment.center,
                               crossAxisAlignment: CrossAxisAlignment.center,
                                 children: [
                                   Text(split[index]['day'],style: TextStyle(
                                    color: AppColor.SelectedTextColor
                                   ),),
                                   Text(split[index]['muscle'],style: TextStyle(
                                    color: AppColor.SelectedTextColor
                                   ),)
                                 ],
                               ),
                             )) 
                            ),
                          ),
                        );
                      },
                    ),
           ),
          ],
        ),
      ) ,
    );
  }
}
List<Map<String,dynamic>> split=[
{
  'day':'Monday',
  'muscle':'Shoulders',
},
{
  'day':'Tuesday',
  'muscle':'Chest & Tricep',
},
{
  'day':'Wednesday',
  'muscle':'Bicep & Back',
},
{
  'day':'Thursday',
  'muscle':'Legs & Abs',
},
{
  'day':'Friday',
  'muscle':'Arms',
},
{
  'day':'Saturday',
  'muscle':'Chest & Back',
},
];