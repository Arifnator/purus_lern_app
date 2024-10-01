import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/my_text_styles.dart';
import 'package:purus_lern_app/src/config/palette.dart';

class MyAnimatedTopBarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const MyAnimatedTopBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          color: Colors.transparent,
          border:
              Border(bottom: BorderSide(width: 0.5, color: borderStrokeGrey))),
      child: Column(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          Row(
            children: [
              const Expanded(
                flex: 2,
                child: SizedBox(),
              ),
              Material(
                color: purusGrey,
                elevation: 6,
                shadowColor: Colors.black,
                clipBehavior: Clip.hardEdge,
                shape: const CircleBorder(),
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Image.asset(
                      "assets/images/Ellipse64.png",
                      fit: BoxFit.cover,
                    )),
              ),
              const SizedBox(
                width: 30,
              ),
              const SizedBox(
                height: 80,
                width: 200,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Willkommen",
                      style: MyTextStyles.mainTitle,
                    ),
                    Text(
                      "Herr Arif Ayduran!",
                      style: MyTextStyles.subTitle,
                    ),
                  ],
                ),
              ),
              const Expanded(
                flex: 3,
                child: SizedBox(),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
