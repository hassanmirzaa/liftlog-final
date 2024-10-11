import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liftlog/Tutorials/tutorial_description.dart';
import 'package:liftlog/Widgets/searchbar.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';
import 'package:liftlog/colors.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({super.key});

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  String searchQuery = "";

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorials'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20,top: 12),
        child: Column(
          children: [
            CustomSearchBar(
              onChanged: (value) {
                setState(() {
                  searchQuery = value; // Update search query
                });
              },
            ),
            const CustomSizedBox(x: 0.02,),
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('tutorials')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final tutorials = snapshot.data?.docs
                        .where((doc) => doc['name']
                            .toString()
                            .toLowerCase()
                            .contains(searchQuery.toLowerCase()))
                        .toList();

                    return ListView.builder(
                      itemCount: tutorials?.length ?? 0,
                      itemBuilder: (context, index) {
                        var tutorial = tutorials![index];

                        return Padding(
                          padding: const EdgeInsets.only(left: 8,right: 8,top: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: AppColor.ThemeColor),
                            child: ListTile(
                              //  tileColor: AppColor.ThemeColor,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.12,
                                width: MediaQuery.of(context).size.width * 0.15,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        tutorial['imageurl'] ?? ''),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                tutorial['name'],
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              subtitle: Text(
                                tutorial['muscle'],
                                style: TextStyle(color: Colors.white),
                              ),
                              trailing: Icon(
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
                    return  Center(child: CircularProgressIndicator(color: AppColor.ThemeColor,));
                  }
                },
              ),
            ),
            CustomSizedBox(x: 0.02)
          ],
        ),
      ),
    );
  }
}