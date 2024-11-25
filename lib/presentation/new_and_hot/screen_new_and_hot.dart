import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/domain/new_and_hot/coming_soon/get_function/upcoming_key/get_function.dart';
import 'package:netflix/presentation/new_and_hot/widget/coming_soon_widget.dart';
import 'package:netflix/presentation/new_and_hot/widget/everyone_watching_widget.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';
import 'package:netflix/presentation/widgets/video_widget.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  @override
  Widget build(BuildContext context) {
    getUpcomingVideoKey();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(90),
          child: AppBar(
            title: const Text(
              "New & Hot",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: kWhiteColor),
            ),
            actions: [
              const Icon(
                Icons.cast,
                color: Colors.white,
                size: 30,
              ),
              kWidth,
              Container(
                color: Colors.blue,
                width: 30,
                height: 30,
              ),
              kWidth
            ],
            bottom: TabBar(
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: kWhiteColor),
              labelColor: kBlackColor,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: kWhiteColor,
              isScrollable: true,
              tabs: const [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "🍿 Coming Soon",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "👀 Everyone's Watching",
                  ),
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(children: [
          _buildComingSoon(context),
          _buildEveryOneWanth(context),
        ]),
      ),
    );
  }

  _buildTabBarView(String name) {
    return Center(
      child: Text(name),
    );
  }

  Widget _buildComingSoon(BuildContext context) {
    return 
           ValueListenableBuilder(
          valueListenable: upcomingVideoKeyNotifier,
          builder: (BuildContext context, videoKey, Widget? child) { 
            if(videoKey.isEmpty){
              return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => ComingSoonWidget(videos: videoKey,idx:index),
            itemCount: videoKey.length,
          );
           },
          
        );
        
        
    
    
  }

  Widget _buildEveryOneWanth(BuildContext context) {
    return ValueListenableBuilder(
          valueListenable: upcomingVideoKeyNotifier,
          builder: (BuildContext context, videoKey, Widget? child) { 
            if(videoKey.isEmpty){
              return Center(
                  child: CircularProgressIndicator(),
                );
            }
            return ListView.builder(
            shrinkWrap: true,
            itemBuilder: (context, index) => EveryoneWatchWidget(videos: videoKey,idx:index),
            itemCount: videoKey.length,
          );
           },
          
        );
  }
}
