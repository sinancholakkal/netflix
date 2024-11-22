import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/presentation/widgets/app_bar_widget.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});

  final List sectionWidget = [
    const SmartDownloads(),
    Section2(),
    const Section3(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemBuilder: (context,index){
          return sectionWidget[index];
        },
        separatorBuilder: (context,index){
          return const SizedBox(height: 25,);
        },
        itemCount: sectionWidget.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://media.themoviedb.org/t/p/w440_and_h660_face/3yYX4MBbmWFYCBF2j00FKqzLAQs.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/7bAS0ENl7pYogOPVNYOo2o03BuO.jpg",
    "https://media.themoviedb.org/t/p/w440_and_h660_face/tWtcyehBCO9fksIj30pdtVldntw.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: kWhiteColor,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        const Text(
          "we will download a personalised selection of movie and shows for you, so there is always something to watch movies on your \n device",
          style: TextStyle(color: Colors.grey, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        kHeight,
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(.5),
              ),
              DownloadsImageWidget(
                image: imageList[0],
                margin: const EdgeInsets.only(left: 150, bottom: 50),
                angle: 20,
                size: Size(size.width * 0.4, size.width * 0.58),
                radius: 10,
              ),
              DownloadsImageWidget(
                image: imageList[1],
                margin: const EdgeInsets.only(right: 170, bottom: 50),
                angle: -20,
                size: Size(size.width * 0.4, size.width * 0.58),
                radius: 10,
              ),
              DownloadsImageWidget(
                image: imageList[2],
                margin: const EdgeInsets.only(bottom: 10),
                size: Size(size.width * 0.45, size.width * 0.65),
                radius: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(kButtonColorBlue)),
            onPressed: () {},
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Set up",
                style: TextStyle(
                    color: kWhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        kHeight,
        ElevatedButton(
          style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(kButtonColorWhite)),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "See what you can download",
              style: TextStyle(
                  color: kBlackColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    );
  }
}

class SmartDownloads extends StatelessWidget {
  const SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kWhiteColor,
        ),
        Text("Smart Downloads")
      ],
    );
  }
}

class DownloadsImageWidget extends StatelessWidget {
  DownloadsImageWidget(
      {super.key,
      required this.image,
      this.angle = 0,
      required this.margin,
      required this.size,
      required this.radius});
  final double radius;
  final Size size;
  final String image;
  final double angle;
  final EdgeInsets margin;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
