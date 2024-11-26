import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/download/get_api_function/get_api_function.dart';
import 'package:netflix/domain/home/south_indian_dramas/get_function/get_south_indian.dart';
import 'package:netflix/presentation/search/widget/search_idl.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatelessWidget {
  final int index;
 final String videoUrl;
  VideoListItem({super.key, required this.index,required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FastLaughVideoPlayer(videoUrl:videoUrl,),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //left Side
                CircleAvatar(
                  backgroundColor: Colors.black.withOpacity(0.5),
                  radius: 25,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.volume_mute,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                //right Side
                 ValueListenableBuilder(
                   valueListenable: southIndianDramaNotifier,
                   builder: (BuildContext context, value, Widget? child) { 
                    return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage("$imageAppentUrl${value[index].posterPath}"),
                          radius: 26,
                        ),
                      ),
                      VideoActionWidget(icon: Icons.emoji_emotions, title: "LOL"),
                      VideoActionWidget(icon: Icons.add, title: "My List"),
                      GestureDetector(child: VideoActionWidget(icon: Icons.share, title: "Share"),),
                      VideoActionWidget(icon: Icons.play_arrow, title: "Play")
                    ],
                                   );
                    },
                   
                 )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActionWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActionWidget({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
      child: Column(
        children: [
          Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
          Text(
            title,
            style: const TextStyle(color: kWhiteColor, fontSize: 16),
          )
        ],
      ),
    );
  }
}

class FastLaughVideoPlayer extends StatefulWidget {
  final String videoUrl;
  FastLaughVideoPlayer({super.key, required this.videoUrl});

  @override
  State<FastLaughVideoPlayer> createState() => _FastLaughVideoPlayerState();
}

class _FastLaughVideoPlayerState extends State<FastLaughVideoPlayer> {
  late VideoPlayerController _videoPlayerController;
  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.network(widget.videoUrl);
    _videoPlayerController.initialize().then((value) {
      setState(() {});
      _videoPlayerController.play();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: _videoPlayerController.value.isInitialized
          ? AspectRatio(aspectRatio: _videoPlayerController.value.aspectRatio,child: VideoPlayer(_videoPlayerController),)
          : const Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
    );
  }
  @override
  void dispose() {
    _videoPlayerController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
