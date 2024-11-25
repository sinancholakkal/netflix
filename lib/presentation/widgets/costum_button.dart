import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';

class CostumButtonWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final double iconSize;
  final double fontSIze;
  final Color textColor;
  const CostumButtonWidget(
      {super.key,
      required this.icon,
      required this.title,
      this.fontSIze = 16,
      this.iconSize = 28,
      this.textColor = kWhiteColor});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: iconSize,
        ),
        Text(
          title,
          style: TextStyle(fontSize: fontSIze, color: textColor),
        )
      ],
    );
  }
}
