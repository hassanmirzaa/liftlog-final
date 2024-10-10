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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              children: [
                SizedBox(
                  height: Height * 0.06,
                ),
          
                //My Diary
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "My Diary",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: const [
                            BoxShadow(
                                blurRadius: 5,
                                //offset: Offset(-1, ),
                                color: Colors.black54,
                                spreadRadius: 1)
                          ]),
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
                SizedBox(
                  height: Height * 0.02,
                ),
          
                //Mediterranean Diet
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mediterranean Diet",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      "Detials",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: Height * 0.02,
                ),
          
                //Container
                Container(
                  //   height: Height * 0.35,
                  width: Width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topRight: Radius.circular(80)),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 5, color: Colors.black54, spreadRadius: 1)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Column(
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
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(' Kcal'),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Icon(Icons.local_fire_department,
                                        color: Colors.pink),
                                    SizedBox(width: 8),
                                    Text(
                                      'Burned',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      '102',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(' Kcal'),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
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
                                    valueColor:  AlwaysStoppedAnimation<Color>(
                                        AppColor.ThemeColor),
                                  ),
                                ),
                                const Text(
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
                        SizedBox(height: Height * 0.05),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            NutrientIndicator(
                                label: 'Carbs',
                                value: '12g left',
                                color: Colors.blue),
                            NutrientIndicator(
                                label: 'Protein',
                                value: '30g left',
                                color: Colors.pink),
                            NutrientIndicator(
                                label: 'Fat',
                                value: '10g left',
                                color: Colors.amber),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: Height * 0.02,
                ),
          
                //Meals today
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Meals today",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                    Text(
                      "Customize",
                      style: TextStyle(fontSize: 18, color: Colors.blue),
                    ),
                  ],
                ),
                SizedBox(
                  height: Height * 0.02,
                ),
                
              ],
            ),
          ),
          SizedBox(height: Height*0.22,
                  child: Expanded(
                    child: ListView.builder(scrollDirection: Axis.horizontal,
                      itemCount: mealsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 15),
                          child: Container(
                            height: Height * 0.18,
                            width: Width * 0.28,
                            decoration: BoxDecoration(
                                color: AppColor.ThemeColor,
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(80)),
                                boxShadow: const [
                                  BoxShadow(
                                      blurRadius: 5,
                                      color: Colors.black54,
                                      spreadRadius: 1)
                                ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        mealsList[index]['title '],
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 18
                                  
                                      ),
                                      ),
                                      Text(
                                        mealsList[index]['meals'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                  
                                      ),
                                      ),
                                      Row(mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                       '${mealsList[index]['calories']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                  
                                      ),
                                      ),
                                      Text(
                                        mealsList[index]['unit'],
                                      style: const TextStyle(
                                        color: Colors.white,
                                  
                                      ),
                                      ),
                                        ],
                                      )
                                  
                                    ],
                                  ),
                                ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                   Container(
          width: Width * 0.9,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(80),
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Colors.black54,
                spreadRadius: 1,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Text(
                      'Weight',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // Spacer(),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.access_time,
                          size: 16,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Today 8:26 AM',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'InBody SmartScale',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          '206.8',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'lbs',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '185 cm',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Height',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '27.3 BMI',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Overweight',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          '20%',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'Body fat',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ), ],
                  ),
                )
        ],
      ),
    );
  }
}

List<Map<String, dynamic>> mealsList =[
{
  'title ' : 'Breakfast',
  'meals' : 'Bread, Peanut butter, Apple',
  'calories' : '525 ',
  'unit' : 'kcal'
},

{
  'title ' : 'Lunch',
  'meals' : 'Chicken Breast , Chapati, Apple',
  'calories' : '450 ',
  'unit' : 'kcal'
},

{
  'title ' : 'Snacks',
  'meals' : 'Almonds, Latte',
  'calories' : '600 ',
  'unit' : 'kcal'
},

{
  'title ' : 'Dinner',
  'meals' : 'Air Fried Chicken, Mayo Garlic sauce',
  'calories' : '680 ',
  'unit' : 'kcal'
}
];