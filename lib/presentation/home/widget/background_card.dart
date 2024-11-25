import 'package:flutter/material.dart';
import 'package:netflix/core/constant/constant.dart';
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
        Container(
          width: double.infinity,
          height: 600,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(kImage), fit: BoxFit.cover)),
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
