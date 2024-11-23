import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
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
      body: ValueListenableBuilder(
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
                    const MainTitleCardHome(
                      title: "Release in the past year",
                    ),
                    kHeight,
                    const MainTitleCardHome(
                      title: "Trending Now",
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
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                10,
                                (index) => NumberCard(
                                      index: index,
                                    )),
                          ),
                        )
                      ],
                    ),
                    kHeight,
                    MainTitleCardHome(
                      title: "Tense Dramas",
                    ),
                    kHeight,
                    MainTitleCardHome(
                      title: "South Indian Cinema",
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
                                Text("TV Shows",style: kHomeTitleStyle,),
                                Text("Movies",style: kHomeTitleStyle,),
                                Text("Categories",style: kHomeTitleStyle,)
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
