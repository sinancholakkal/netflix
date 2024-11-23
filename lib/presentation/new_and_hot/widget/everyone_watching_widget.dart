import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryoneWatchWidget extends StatelessWidget {
  const EveryoneWatchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          "Frieds",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight,
        Text(
          "This hit sitcom follows the merry misadventures of six\n20-something pals as they navigate the pitfalls of\n, life and love in 1990s Manhattan.",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
        ),
        SizedBox(
          height: 50,
        ),
        VideoWidget(),
        kHeight20,
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CostumButtonWidget(
              icon: Icons.share,
              title: "Share",
              iconSize: 25,
              fontSIze: 12,
              textColor: Colors.grey,
            ),
            kWidth20,
            CostumButtonWidget(
              icon: Icons.add,
              title: "My List",
              iconSize: 30,
              fontSIze: 12,
              textColor: Colors.grey,
            ),
            kWidth20,
            CostumButtonWidget(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 30,
              fontSIze: 12,
              textColor: Colors.grey,
            ),
            kWidth20
          ],
        ),
        
      ],
    );
  }
}