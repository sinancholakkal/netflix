import 'package:flutter/material.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'package:netflix/domain/new_and_hot/coming_soon/model/upcoming_video_key/upcoming_video_key.dart';

class VideoWidget extends StatelessWidget {
  List<UpcomingVideoKey> videos = [];
  int index;
  VideoWidget({super.key, required this.videos, required this.index});
  ValueNotifier<bool> isVolum = ValueNotifier(false);
  @override
  Widget build(BuildContext context) {
    print("$videoBaseUrl${videos[index].key}");
    print("======================================================");
    return Stack(
      children: [
        ValueListenableBuilder(
          
          valueListenable: isVolum,
          builder: (BuildContext context, value, Widget? child) { 
            return SizedBox(
            width: double.infinity,
            height: 200,
            child: YoutubePlayer(
              controller: YoutubePlayerController(
                initialVideoId: "${videos[index].key}",
                flags: YoutubePlayerFlags(
                  autoPlay: false,
                  mute: value,
                ),
              ),
              showVideoProgressIndicator: true,
            ),
          );
           },
        ),
        Positioned(
          right: 0,
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black45,
              child: Center(
                child: ValueListenableBuilder(
                  valueListenable: isVolum,
                  builder: (BuildContext context, value, Widget? child) { 
                    return IconButton(
                    onPressed: () {
                      isVolum.value = !value;
                      isVolum.notifyListeners();
                    },
                    icon:  Icon((value==false)? Icons.volume_down :
                      Icons.volume_off,
                      size: 20,
                      color: Colors.white,
                    ),
                  );
                   },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
