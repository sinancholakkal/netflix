import 'package:flutter/cupertino.dart';

class MainCardHome extends StatelessWidget {
  const MainCardHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Container(
        width: 130,
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "https://media.themoviedb.org/t/p/w440_and_h660_face/flSncTaSISRqrqoJ18ZBmThR4Ee.jpg",
            ),
          ),
        ),
      ),
    );
  }
}
