import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zenaura/Services/firebase_services.dart';
import 'package:zenaura/screens/music_player_page.dart';
import 'package:zenaura/maintab_screens/favourite_page.dart';

import 'package:zenaura/screens/userHistory_page.dart';

class HappyMoodPage extends StatelessWidget {
  final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: 100.0,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text('Happy Mood',
            style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => UserHistoryPage()),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FavoriteSongsPage()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebaseServices.getTracks('happy'),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          var tracks = snapshot.data!.docs;

          return ListView.builder(
            itemCount: tracks.length,
            itemBuilder: (context, index) {
              var track = tracks[index];
              return ListTile(
                title:
                    Text(track['title'], style: TextStyle(color: Colors.white)),
                trailing: FavoriteButton(song: track['title']),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MusicPlayerPage(url: track['url']),
                    ),
                  );
                  _storeSongClick(track['title']);
                },
              );
            },
          );
        },
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  final String song;

  FavoriteButton({required this.song});

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _toggleFavorite(),
      onDoubleTap: () => _removeFavorite(),
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : null,
      ),
    );
  }

  void _toggleFavorite() async {
    final favoritesRef = FirebaseFirestore.instance.collection('favorites');

    // Check if the song is already in favorites
    final querySnapshot =
        await favoritesRef.where('song', isEqualTo: widget.song).get();

    if (querySnapshot.docs.isEmpty) {
      // If the song is not in favorites, add it
      favoritesRef.add({
        'song': widget.song,
        'timestamp': FieldValue.serverTimestamp(),
      });
      setState(() {
        isFavorite = true;
      });
    } else {
      // If the song is already in favorites, remove it
      for (DocumentSnapshot doc in querySnapshot.docs) {
        doc.reference.delete();
      }
      setState(() {
        isFavorite = false;
      });
    }
  }

  void _removeFavorite() {
    setState(() {
      isFavorite = false;
    });
    FirebaseFirestore.instance
        .collection('favorites')
        .where('song', isEqualTo: widget.song)
        .get()
        .then((snapshot) {
      for (DocumentSnapshot doc in snapshot.docs) {
        doc.reference.delete();
      }
    });
  }
}

void _storeSongClick(String song) {
  FirebaseFirestore.instance.collection('userhistory').add({
    'song': song,
    'timestamp': FieldValue.serverTimestamp(),
  });
}
