import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCardHome extends StatelessWidget {
  final String title;
   List<dynamic> listResult =[];
   MainTitleCardHome({super.key, required this.title,required this.listResult});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitleWidget(
          title: title,
        ),
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(listResult.length, (index) => MainCardHome(imageUrl: listResult[index].posterPath ?? listResult[index].name)),
          ),
        )
      ],
    );
  }
}
