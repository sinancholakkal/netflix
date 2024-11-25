import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/model/upcoming_video_key/upcoming_video_key.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class EveryoneWatchWidget extends StatelessWidget {
    List<UpcomingVideoKey> videos =[];
  int idx;
   EveryoneWatchWidget({
    super.key,
    required this.idx,
    required this.videos,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          videos[idx].name.toString(),
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
        VideoWidget(videos:videos,index: idx,),
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
