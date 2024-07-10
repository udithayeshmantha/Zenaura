import 'package:flutter/material.dart';

ThemeData light = ThemeData(
  brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
    ),


    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        unselectedItemColor: Colors.black87,
        selectedItemColor: Colors.grey,

    ),



    colorScheme: const ColorScheme.light(
     // background : Colors.deepPurple,
      primary: Colors.purple,
      secondary: Colors.purpleAccent,
));

ThemeData dark = ThemeData(
  brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
    ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     unselectedItemColor: Colors.white,
     selectedItemColor: Colors.grey,
     backgroundColor: Colors.black,
      ),

  colorScheme: const ColorScheme.dark(
   // background : Colors.black,
    primary: Colors.grey,
    secondary: Colors.white10,
  )
);