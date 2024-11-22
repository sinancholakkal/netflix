import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

const imageUrl =
    "https://media.themoviedb.org/t/p/w500_and_h282_face/rOmUuQEZfPXglwFs5ELLLUDKodL.jpg";

class SearchIdlWidget extends StatelessWidget {
  const SearchIdlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Top Search",),
        kHeight,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => TopSearchItemTile(),
            separatorBuilder: (context, index) => kHeight20,
            itemCount: 10,
          ),
        )
      ],
    );
  }
}



class TopSearchItemTile extends StatelessWidget {
  TopSearchItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          width: screenWidth * 0.35,
          height: 65,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        Expanded(
            child: Text(
          "Movie name",
          style: TextStyle(color: kWhiteColor, fontSize: 16),
        )),
        Icon(Icons.play_circle_outline_outlined,color: Colors.white,size: 45,)
      ],
    );
  }
}
