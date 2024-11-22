import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';

class AppBarWidget extends StatelessWidget {
  final title;
   AppBarWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),)),
        Icon(Icons.cast,color: Colors.white,size: 30,),
        kWidth,
        Container(
          color: Colors.blue,
          width: 30,
          height: 30,
        ),
        kWidth
      ],
    );
  }
}