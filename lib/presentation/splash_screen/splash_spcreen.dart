import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/presentation/main_page/screen_main_page.dart';

class SplashSpcreen extends StatelessWidget {
  const SplashSpcreen({super.key});

  @override
  Widget build(BuildContext context) {
    goTo(context);
    return Scaffold(
      body: Center(
        child: Image.network("https://c.tenor.com/Hh5lO8fCAAIAAAAC/tenor.gif"),
      ),
    );
  }
  Future<void>goTo(BuildContext context)async{
    await Future.delayed(Duration(milliseconds: 1900));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx){
      return ScreenMainPage();
    }));
  }
}