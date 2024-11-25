import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
import 'package:netflix/core/constant/strings.dart';
import 'package:netflix/domain/home/south_indian_dramas/get_function/get_south_indian.dart';
import 'package:netflix/presentation/home/screen_home.dart';
import 'package:netflix/presentation/widgets/costum_button.dart';

class BackgroundCard extends StatelessWidget {
  const BackgroundCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ValueListenableBuilder(
          valueListenable: southIndianDramaNotifier,
          builder: (BuildContext context, value, Widget? child) { 
           return Container(
            width: double.infinity,
            height: 600,
            decoration:  BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage("$imageAppentUrl${value[0].posterPath}"), fit: BoxFit.cover)),
          );
           },
          
        ),
        const Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CostumButtonWidget(
                title: "My List",
                icon: Icons.add,
              ),
              PlayButton(),
              CostumButtonWidget(
                title: "Info",
                icon: Icons.info,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
