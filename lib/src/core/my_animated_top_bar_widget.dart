// App bar aninmation + logo + shadows

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
              Border(bottom: BorderSide(width: 1, color: Color(0x358A8A8E)))),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Material(
            color: purusGrey,
            elevation: 10,
            shadowColor: Colors.black,
            clipBehavior: Clip.hardEdge,
            shape: CircleBorder(),
            child: SizedBox(height: 90, width: 90, child: Placeholder()),
          ),
          Column(
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
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
