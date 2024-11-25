import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/model/upcoming_video_key/upcoming_video_key.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  List<UpcomingVideoKey> videos =[];
  int idx;
   ComingSoonWidget({
    super.key,
    required this.videos,
    required this.idx
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          width: 50,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "FEB",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Text(
                "11",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    letterSpacing: 6),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          //height: 500,
          child:  Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                VideoWidget(index: idx, videos: videos,),
                kHeight,
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        //overflow: TextOverflow.ellipsis,
                        //maxLines: 2,
                        "${videos[idx].name}",
                        style: TextStyle(
                          letterSpacing: -2,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        CostumButtonWidget(
                          icon: Icons.notifications_none,
                          title: "Remind me",
                          iconSize: 20,
                          fontSIze: 12,
                          textColor: Colors.grey,
                        ),
                        kWidth,
                        kWidth,
                        CostumButtonWidget(
                          icon: Icons.info_outline,
                          title: "Info",
                          iconSize: 20,
                          fontSIze: 12,
                          textColor: Colors.grey,
                        ),
                        kWidth,
                        kWidth
                      ],
                    )
                  ],
                ),
                Text("Coming on friday"),
                kHeight,
                Text(
                  "${videos[idx].name}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                kHeight,
                Text(
                  "Landing the lead in the school musicial is a\ndrea come true for Jodi,until the pressure\nsends her confidence -- and her relationship --\ninto a tailspin",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
