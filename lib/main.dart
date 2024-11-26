import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/domain/download/get_api_function/get_api_function.dart';
import 'package:netflix/domain/home/release_in_the_past/get_function/get_fuction.dart';
import 'package:netflix/domain/home/south_indian_dramas/get_function/get_south_indian.dart';
import 'package:netflix/domain/home/tense_drama/get_function/get_tense_drama.dart';
import 'package:netflix/domain/home/top_tv_show/get_function/get_function.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/get_function/upcoming_id/upcoming_movie_id_function.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/get_function/upcoming_key/get_function.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';
import 'package:netflix/presentation/splash_screen/splash_spcreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    getSouthIndianDrama();
    getUpcomingMovieId();
    getUpcomingVideoKey();
    getReleaseInThePastYear();
    getDownload();
    getTopTvShow();
    getTenseDrama();
    
    //getDownload();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          fontFamily: GoogleFonts.montserrat().fontFamily,
          primaryColor: Colors.blue,
          textTheme: const TextTheme(
              bodyMedium: TextStyle(color: Colors.white),
              bodySmall: TextStyle(color: Colors.white)),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.black),
      home: //ScreenMainPage(),
      SplashSpcreen()
    );
  }
}
