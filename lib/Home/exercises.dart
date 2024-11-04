import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liftlog/Colors.dart';
import 'package:liftlog/Tutorials/tutorial_description.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(240),
                  ),
                  color: AppColor.ThemeColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Monday",
                    style: TextStyle(color: AppColor.PrimaryColor, fontSize: 25),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('tutorials')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final tutorials = snapshot.data?.docs.toList();

                      return ListView.builder(
                        itemCount: tutorials?.length ?? 0,
                        itemBuilder: (context, index) {
                          var tutorial = tutorials![index];

                          return Padding(
                            padding: const EdgeInsets.only(left: 8, right: 8, top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColor.ThemeColor,
                              ),
                              child: ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DiscriptionScreen(
                                          tutorialSnapshot: tutorial.data()),
                                    ),
                                  );
                                },
                                leading: Container(
                                  height: MediaQuery.of(context).size.height * 0.12,
                                  width: MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(tutorial['imageurl'] ?? ''),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                title: Text(
                                  tutorial['name'],
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                                subtitle: Text(
                                  tutorial['muscle'],
                                  style: const TextStyle(color: Colors.white),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      return Center(child: CircularProgressIndicator(color: AppColor.ThemeColor));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
