import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constant/strings.dart';

class MainCardHome extends StatelessWidget {
  String imageUrl;
   MainCardHome({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Container(
        width: 130,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "$imageAppentUrl$imageUrl",
            ),
          ),
        ),
      ),
    );
  }
}
