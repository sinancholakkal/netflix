import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/core/colors/colors.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/download/get_api_function/get_api_function.dart';
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
        itemBuilder: (context, index) {
          return sectionWidget[index];
        },
        separatorBuilder: (context, index) {
          return const SizedBox(
            height: 25,
          );
        },
        itemCount: sectionWidget.length,
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imageList = [
    "https://imgs.search.brave.com/8H60opDYRJGCxLvAYvfGnV9ghlHxLgxjJeWX7ahn4AI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9pLnBp/bmltZy5jb20vb3Jp/Z2luYWxzL2UxLzE5/Lzc0L2UxMTk3NDhh/YTI2NDU4MGIzMjdl/NTc5OGYyMmNhNWI5/LmpwZw",
    "https://imgs.search.brave.com/gME_3weBpboWS__m2dGMBMFKkybN8T8iMgKRfoKRpxI/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/am9ibG8uY29tL3dw/LWNvbnRlbnQvdXBs/b2Fkcy8yMDI0LzA3/LzE5OTItcG9zdGVy/LTQwMHg2MDAuanBn",
    "https://imgs.search.brave.com/JxRCalAZzgoM-vyrUnxgtzVojzuvIPxqY29-81csugM/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvNDU4/NDY3MTYzL3Bob3Rv/L3RoZS1maXJzdC1h/dmVuZ2VyLW1vdmll/LXBvc3Rlci5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9NUNt/c1hzcXhMbkhTdVBJ/NDJFWmRabFRJU3U5/aUw2U0pCRkotQVFE/QUdSRT0"
  ];

  @override
  Widget build(BuildContext context) {
    //getDownload();
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
          child: ValueListenableBuilder(
            valueListenable: downloadNotifier,
            builder: (BuildContext context, images, Widget? child) {
              return FutureBuilder(
                future: getDownload(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return const Center(child: CircularProgressIndicator());
                  }else{
                    return Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: size.width * 0.4,
                      backgroundColor: Colors.grey.withOpacity(.5),
                    ),
                    DownloadsImageWidget(
                      image: "$imageAppentUrl${images[0].posterPath}",
                      margin: const EdgeInsets.only(left: 150, bottom: 50),
                      angle: 20,
                      size: Size(size.width * 0.4, size.width * 0.58),
                      radius: 10,
                    ),
                    DownloadsImageWidget(
                      image: "$imageAppentUrl${images[1].posterPath}",
                      margin: const EdgeInsets.only(right: 170, bottom: 50),
                      angle: -20,
                      size: Size(size.width * 0.4, size.width * 0.58),
                      radius: 10,
                    ),
                    DownloadsImageWidget(
                      image: "$imageAppentUrl${images[2].posterPath}",
                      margin: const EdgeInsets.only(bottom: 10),
                      size: Size(size.width * 0.45, size.width * 0.65),
                      radius: 20,
                    )
                  ],
                );
                  }
                },
                 
              );
            },
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
