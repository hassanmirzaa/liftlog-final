import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:liftlog/Tutorials/tutorial_description.dart';
import 'package:liftlog/Widgets/custom_sizedbox.dart';
import 'package:liftlog/colors.dart';

class TutorialsScreen extends StatefulWidget {
  const TutorialsScreen({super.key});

  @override
  State<TutorialsScreen> createState() => _TutorialsScreenState();
}

class _TutorialsScreenState extends State<TutorialsScreen> {
  String searchQuery = "";
  bool isSearchBarVisible = false;
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.BackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 55),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Colors.grey.shade800,
                  Colors.grey.shade800,
                  Colors.grey,
                  Colors.grey.shade800
                ]),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Tutorials',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              isSearchBarVisible = !isSearchBarVisible;
                            });
                          },
                          icon: const Icon(
                            Icons.search_rounded,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: height * 0.001),
                    AnimatedCrossFade(
                      firstChild: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          hintText: "Search Exercise",
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          prefixIcon: const Icon(Icons.search),
                        ),
                        onChanged: (value) {
                          setState(() {
                            searchQuery = value;
                          });
                        },
                      ),
                      secondChild: const SizedBox(),
                      crossFadeState: isSearchBarVisible
                          ? CrossFadeState.showFirst
                          : CrossFadeState.showSecond,
                      duration: const Duration(milliseconds: 300),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
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
                          padding: const EdgeInsets.only(
                              left: 8, right: 8, bottom: 10),
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
                                      tutorialSnapshot: tutorial.data()
                                          as Map<String, dynamic>,
                                    ),
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
                                      tutorial['imageurl'] ?? '',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              title: Text(
                                tutorial['name'],
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              subtitle: Text(
                                capitalize(tutorial['muscle']),
                                style: const TextStyle(color: Colors.orange),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.orange,
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else {
                    return Center(
                        child: CircularProgressIndicator(
                            color: AppColor.ThemeColor));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

String capitalize(String text) {
  if (text.isEmpty) {
    return text;
  }
  return text[0].toUpperCase() + text.substring(1);
}
