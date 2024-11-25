import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/download/get_api_function/get_api_function.dart';
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
        SearchTextTitle(
          title: "Top Search",
        ),
        kHeight,
        FutureBuilder(
          future: getDownload(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Expanded(
                child: ValueListenableBuilder(
                  valueListenable: downloadNotifier,
                  builder: (BuildContext context, topSearch, Widget? child) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return TopSearchItemTile(
                          imagePath:
                              '$imageAppentUrl${topSearch[index].posterPath}',
                          imageName: topSearch[index].title ?? topSearch[index].name!,
                        );
                      },
                      separatorBuilder: (context, index) => kHeight20,
                      itemCount: topSearch.length,
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  String imagePath;
  String imageName;
  TopSearchItemTile(
      {super.key, required this.imageName, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return ValueListenableBuilder(
      valueListenable: downloadNotifier,
      builder: (BuildContext context, topSearch, Widget? child) {
        return Row(
          children: [
            Container(
              width: screenWidth * 0.35,
              height: 65,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(imagePath),
                ),
              ),
            ),
            kWidth,
            Expanded(
                child: Text(
              imageName,
              style: TextStyle(color: kWhiteColor, fontSize: 16),
            )),
            Icon(
              Icons.play_circle_outline_outlined,
              color: Colors.white,
              size: 45,
            )
          ],
        );
      },
    );
  }
}
