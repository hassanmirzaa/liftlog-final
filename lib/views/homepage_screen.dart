import 'package:flutter/material.dart';
import 'package:liftlog/Colors.dart';
import 'package:liftlog/testing.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    final Height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.PrimaryColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28),
        child: Column(
          
          children: [
                SizedBox(height: Height*0.06,),

                //My Diary
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "My Diary",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    boxShadow: [
                       const BoxShadow(
                        blurRadius: 5,
                        //offset: Offset(-1, ),
                        color: Colors.black54,
                        spreadRadius: 1
                      )
                    ]
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 28,
                      color: Colors.black87,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: Height*0.02,),


            //Mediterranean Diet
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Mediterranean Diet",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black54
                  ),
                ),

                Text(
                  "Detials",
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue
                  ),
                ),
              ],
            ),
            SizedBox(height: Height*0.02,),


            //Container
            Container(
              height: Height*0.35,
              width: Width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(80)
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black54,
                    spreadRadius: 1
                  )
                ]
              ),
              child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.local_dining, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Eaten',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '1127',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(' Kcal'),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.local_fire_department, color: Colors.pink),
                      SizedBox(width: 8),
                      Text(
                        'Burned',
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '102',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Text(' Kcal'),
                    ],
                  ),
                ],
              ),
              Spacer(),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: 1503 / 2500, // Progress ratio (example)
                      strokeWidth: 8,
                      backgroundColor: Colors.grey[200],
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blueAccent),
                    ),
                  ),
                  Text(
                    '1503\nKcal left',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NutrientIndicator(label: 'Carbs', value: '12g left', color: Colors.blue),
              NutrientIndicator(label: 'Protein', value: '30g left', color: Colors.pink),
              NutrientIndicator(label: 'Fat', value: '10g left', color: Colors.amber),
            ],
          )
        ],
      ),
            ),
          ],
        ),
      ),
    );
  }
}
