import 'package:flutter/material.dart';

ThemeData light = ThemeData(               //light
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
      primary: Colors.purple,                    // light colorscheme
      secondary: Colors.purpleAccent,
));


ThemeData dark = ThemeData(                         //dark
  brightness: Brightness.dark,


    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,               //app bar default
    ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
     unselectedItemColor: Colors.white,
     selectedItemColor: Colors.grey,             //BottomNavbar admin
     backgroundColor: Colors.black,
      ),

  colorScheme: const ColorScheme.dark(
   // background : Colors.black,
    primary: Colors.grey,
    secondary: Colors.white10                     //dark colorscheme
  )
);