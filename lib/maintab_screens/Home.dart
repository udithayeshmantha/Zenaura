import 'package:flutter/material.dart';
import 'package:zenaura/Components/moodcard.dart';
import 'package:zenaura/model/mood.dart';
import 'package:zenaura/moods%20page/angry_mood_page.dart';
import 'package:zenaura/moods%20page/happy_mood_page.dart';
import 'package:zenaura/moods%20page/neutral_mood_page.dart';
import 'package:zenaura/moods%20page/sad_mood_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Mood> moods = [
    Mood(
      mood: 'Happy',
      moodDescription: 'Feeling Happy',
      Color: Colors.blue,
      Page: HappyMoodPage(),
    ),
    Mood(
      mood: 'Sad',
      moodDescription: 'Feeling bad',
      Color: Colors.purple,
      Page: SadMoodPage(),
    ),
    Mood(
      mood: 'Neutral',
      moodDescription: 'Feeling neutral',
      Color: Colors.green,
      Page: NeutralMoodPage(),
    ),
    Mood(
      mood: 'Angry',
      moodDescription: 'Feeling angry',
      Color: Colors.red,
      Page: AngryMoodPage(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/home_bg.png',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Container(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.black54,
                    ),
                    child: SingleChildScrollView(
                      child: Container(
                        padding: const EdgeInsets.only(top: 25, left: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 50,
                            ),
                            const Text(
                              "Home",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Moods",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            SizedBox(
                              child: ListView.builder(
                                controller: ScrollController(),
                                shrinkWrap: true,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return Moodcard(
                                    mood: moods[index],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
