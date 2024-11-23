import 'package:flutter/cupertino.dart';
import 'package:netflix/presentation/widgets/main_card.dart';
import 'package:netflix/presentation/widgets/main_title.dart';

class MainTitleCardHome extends StatelessWidget {
  final String title;
  const MainTitleCardHome({
    super.key,
    required this.title
  });

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
            children: List.generate(10, (index)=>MainCardHome()),
          ),
        )
      ],
    );
  }
}
