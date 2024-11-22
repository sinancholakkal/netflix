import 'package:flutter/cupertino.dart';

class SearchTextTitle extends StatelessWidget {
  final String title;
   SearchTextTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    );
  }
}