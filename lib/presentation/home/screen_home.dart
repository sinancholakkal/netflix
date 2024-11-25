import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/domain/download/get_api_function/get_api_function.dart';
import 'package:netflix/domain/home/release_in_the_past/get_function/get_fuction.dart';
import 'package:netflix/domain/home/south_indian_dramas/get_function/get_south_indian.dart';
import 'package:netflix/domain/home/tense_drama/get_function/get_tense_drama.dart';
import 'package:netflix/domain/home/top_tv_show/get_function/get_function.dart';
import 'package:netflix/presentation/home/widget/background_card.dart';
import 'package:netflix/presentation/home/widget/number_card.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';
import 'package:netflix/presentation/widgets/main_title.dart';
import 'package:netflix/presentation/widgets/main_title_card_home.dart';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});
  ValueNotifier<bool> scrollNotifer = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSouthIndianDrama(),
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          return ValueListenableBuilder(
          valueListenable: scrollNotifer,
          builder: (BuildContext context, scrollValue, Widget? child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (Notification) {
                final ScrollDirection direction = Notification.direction;
                if (direction == ScrollDirection.reverse) {
                  return scrollNotifer.value = true;
                } else if (direction == ScrollDirection.forward) {
                  return scrollNotifer.value = false;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      BackgroundCard(),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: releaseInThePastYearNotifier,
                        builder: (BuildContext context, releasePatList,
                            Widget? child) {
                          return MainTitleCardHome(
                            listResult: releasePatList,
                            title: "Release in the past year",
                          );
                        },
                      ),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: downloadNotifier,
                        builder:
                            (BuildContext context, trendingList, Widget? child) {
                          return MainTitleCardHome(
                            title: "Trending Now",
                            listResult: trendingList,
                          );
                        },
                      ),
                      kHeight,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MainTitleWidget(
                            title: "Top 10 Tv Shows In India Today",
                          ),
                          LimitedBox(
                            maxHeight: 200,
                            child: ValueListenableBuilder(
                              valueListenable: topTvShowsNotifier,
                              builder: (BuildContext context, topTvShowList, Widget? child) {
                                return ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                    10,
                                    (index) => NumberCard(
                                      imageUrl: topTvShowList[index].posterPath!,
                                          index: index,
                                        )),
                              );
                                },
                              
                            ),
                          )
                        ],
                      ),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: tenseDramaNotifier,
                        builder: (BuildContext context, tenseDramaList, Widget? child) { 
                          return MainTitleCardHome(
                          title: "Tense Dramas", listResult: tenseDramaList,
                        );
                         },
                        
                      ),
                      kHeight,
                      ValueListenableBuilder(
                        valueListenable: southIndianDramaNotifier,
                        builder: (BuildContext context, southIdianDramaList, Widget? child) { 
                          return MainTitleCardHome(
                          title: "South Indian Dramas", listResult: southIdianDramaList,
                        );
                         },
                        
                      ),
                    ],
                  ),
                  scrollNotifer.value == false
                      ? AnimatedContainer(
                          duration: Duration(seconds: 2),
                          width: double.infinity,
                          height: 90,
                          color: Colors.black.withOpacity(0.3),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.network(
                                    width: 60,
                                    height: 60,
                                    "https://imgs.search.brave.com/bIiB4pUxdipjqjO0L07QtoziLa2IEDVrAoVbgtl8728/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9hc3Nl/dHMuc3RpY2twbmcu/Y29tL2ltYWdlcy82/Mjk3NjQ3YzdlYzc2/YjgyZmIyMWZjZTMu/cG5n",
                                  ),
                                  Spacer(),
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
                              ),
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "TV Shows",
                                    style: kHomeTitleStyle,
                                  ),
                                  Text(
                                    "Movies",
                                    style: kHomeTitleStyle,
                                  ),
                                  Text(
                                    "Categories",
                                    style: kHomeTitleStyle,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      : kHeight
                ],
              ),
            );
          },
        );
        },
        
      ),
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 125,
      height: 45,
      child: TextButton.icon(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: const WidgetStatePropertyAll(
            Colors.white,
          ),
        ),
        onPressed: () {},
        label: const Text(
          "Play",
          style: TextStyle(fontSize: 18, color: kBlackColor),
        ),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: Colors.black,
        ),
      ),
    );
  }
}
