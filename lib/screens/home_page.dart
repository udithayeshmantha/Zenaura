import 'package:flutter/material.dart';
import 'package:zenaura/moods%20page/happy_mood_page.dart';
import 'package:zenaura/moods%20page/sad_mood_page.dart';
import 'package:zenaura/moods%20page/angry_mood_page.dart';
import 'package:zenaura/moods%20page/neutral_mood_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Emotion-based Music Player')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HappyMoodPage()),
                );
              },
              child: Text('Happy'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SadMoodPage()),
                );
              },
              child: Text('Sad'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AngryMoodPage()),
                );
              },
              child: Text('Angry'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NeutralMoodPage()),
                );
              },
              child: Text('Neutral'),
            ),
          ],
        ),
      ),
    );
  }
}
