import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_clone/core/colors/colors.dart';
import 'package:netflix_clone/presentation/mainpage/screen_main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        primarySwatch: Colors.blue,
        textTheme:const TextTheme(
        bodyLarge: TextStyle(color:  Colors.white),
        bodyMedium: TextStyle(color: Colors.white)

        )
      ),
      home: ScreenMainPage(),
    );
  }
}
