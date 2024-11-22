import 'package:flutter/cupertino.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/presentation/search/widget/search_title.dart';

const imageUrl =
    "https://imgs.search.brave.com/8H60opDYRJGCxLvAYvfGnV9ghlHxLgxjJeWX7ahn4AI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2UxLzE5/Lzc0L2UxMTk3NDhh/YTI2NDU4MGIzMjdl/NTc5OGYyMmNhNWI5/LmpwZw";

class SearchResultWidget extends StatelessWidget {
  const SearchResultWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchTextTitle(title: "Movies & Tv"),
        kHeight,
        Expanded(
            child: GridView.count(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1/1.4,
          children: List.generate(20, (context) {
            return const MainCard();
          }),
        ))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
            fit: BoxFit.cover,
        image: NetworkImage(
          imageUrl,
        ),
      )),
    );
  }
}
