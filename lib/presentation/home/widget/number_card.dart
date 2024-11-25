import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/strings.dart';

class NumberCard extends StatelessWidget {
  final int index;
  final String imageUrl;
  const NumberCard({super.key, required this.index,required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            SizedBox(
              height: 200,
              width: 35,
            ),
            Container(
              width: 130,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image:  DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "$imageAppentUrl$imageUrl",
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          left: 20,
          bottom: -40,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 10,
            child: Text(
              "${index + 1}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 130,
                decoration: TextDecoration.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
