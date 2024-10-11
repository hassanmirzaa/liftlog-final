import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';
import 'package:liftlog/Widgets/exercise_add.dart';
import 'package:liftlog/Widgets/searchbar.dart';
import 'package:liftlog/Widgets/square_button.dart';
import 'package:liftlog/colors.dart';

class ExerciseSet {
  final TextEditingController weightController;
  final TextEditingController repsController;

  ExerciseSet({required this.weightController, required this.repsController});
}

class ExerciseList extends StatefulWidget {
  const ExerciseList({super.key});

  @override
  State<ExerciseList> createState() => _ExerciseListState();
}

class _ExerciseListState extends State<ExerciseList> {
  String searchQuery = '';
  String? selectedExercise;
  bool exerciseAdded = false;
  List<Map<String, dynamic>> exercises = [];

  @override
  Widget build(BuildContext context) {
    return exerciseAdded
        ? Center(
            child: Column(
              children: [
                if (selectedExercise != null)
                  Expanded(
                    child: ListView.builder(
                      itemCount: exercises.length,
                      itemBuilder: (context, index) {
                        final exercise = exercises[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.ThemeColor,
                                      borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Container(
                                  
                                  margin: const EdgeInsets.all(8.0),
                                  height: MediaQuery.of(context).size.height * 0.07,
                                  width: MediaQuery.of(context).size.width * 0.75,
                                  decoration: BoxDecoration(
                                      color: AppColor.ThemeColor,
                                      border: Border.all(color: Colors.white),
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Center(
                                      child: Text(
                                    exercise['name'],
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: exercise['sets']!.length,
                                  itemBuilder: (context, setIndex) {
                                    final set = exercise['sets'][setIndex];
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: MediaQuery.of(context).size.height * 0.05,
                                        width: MediaQuery.of(context).size.width * 0.75,
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            Text('Weight:',
                                    style: TextStyle(color: Colors.white)),
                                            Container(
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width * 0.13,
                                              child: Center(
                                                child: TextField(
                                                  controller: set.weightController,
                                                  keyboardType: TextInputType.number,
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                                                    
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text('Reps:',
                                    style: TextStyle(color: Colors.white)),
                                            Container(
                                              color: Colors.white,
                                              width: MediaQuery.of(context).size.width * 0.13,
                                              child: TextField(
                                                controller: set.repsController,
                                                keyboardType: TextInputType.number,
                                                decoration: InputDecoration(
                                                  isDense: true,
                                                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                            
                                CustomSizedBox(x: 0.02),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      exercise['sets'].add(ExerciseSet(
                                        weightController: TextEditingController(),
                                        repsController: TextEditingController(),
                                      ));
                                    });
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.all(8.0),
                                    height: MediaQuery.of(context).size.height * 0.07,
                                    width: MediaQuery.of(context).size.width * 0.65,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 2,
                                              color: AppColor.ThemeColor,
                                              offset: Offset(2, -1))
                                        ],
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                        child: Text(
                                      " + Add Set",
                                      style: TextStyle(color: AppColor.ThemeColor),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                else
                  CustomSizedBox(x: 0.05),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AddExerciseButton(
                        onPress: () {
                          setState(() {
                            exerciseAdded = false;
                          });
                        },
                      ),
                      SquareButton(
                        widthSize: 0.3,
                         heading: "Submit",
                          heightSize: 0.1,
                          onPress: (){
                            setState(() {
                              exercises.clear();
                              
                            });
                          },
                          )
                    ],
                  ),
                ),
              ],
            ),
          )
        : Column(
            children: [
              CustomSearchBar(
                onChanged: (String value) {
                  setState(() {
                    searchQuery =
                        value.toLowerCase(); // Update the search query
                  });
                },
              ),
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('tutorials')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                        child: CircularProgressIndicator(
                            color: AppColor.ThemeColor));
                  }
                  final tutorials = snapshot.data!.docs;

                  // Filter tutorials based on the search query
                  final filteredTutorials = tutorials.where((tutorial) {
                    final tutorialName =
                        tutorial['name'].toString().toLowerCase();
                    final tutorialMuscle =
                        tutorial['muscle'].toString().toLowerCase();
                    return tutorialName.contains(searchQuery) ||
                        tutorialMuscle.contains(searchQuery);
                  }).toList();

                  return Expanded(
                    child: ListView.builder(
                      itemCount: filteredTutorials.length,
                      itemBuilder: (context, index) {
                        var tutorial = filteredTutorials[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration( 
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.ThemeColor,
                            ),
                            child: ListTile(
                              leading: Image.network(tutorial['imageurl']),
                              title: Text(
                                tutorial['name'],
                                style: TextStyle(color: Colors.white),
                              ),
                              subtitle: Text(
                                tutorial['muscle'],
                                style: TextStyle(color: Colors.white), 
                              ),
                              onTap: () {
                                setState(() {
                                  selectedExercise = tutorial['name'];
                                  exerciseAdded = true;
                                  exercises.add({
                                    'name': tutorial['name'],
                                    'sets': [ExerciseSet(
                                      weightController: TextEditingController(),
                                      repsController: TextEditingController(),
                                    )]
                                  });
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ],
          );
  }
}
