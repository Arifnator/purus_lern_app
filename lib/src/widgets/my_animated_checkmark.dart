import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/palette.dart';

class MyAnimatedCheckmark extends StatefulWidget {
  const MyAnimatedCheckmark({
    super.key,
    this.circleSize = 25,
    this.iconSize = 22,
    this.outsideColor = purusGreen,
    this.insideColor = Colors.white,
  });

  final double circleSize;
  final double iconSize;
  final Color outsideColor;
  final Color insideColor;

  @override
  State<MyAnimatedCheckmark> createState() => _MyAnimatedCheckmarkState();
}

class _MyAnimatedCheckmarkState extends State<MyAnimatedCheckmark>
    with TickerProviderStateMixin {
  late AnimationController scaleController = AnimationController(
      duration: const Duration(milliseconds: 800), vsync: this);
  late Animation<double> scaleAnimation =
      CurvedAnimation(parent: scaleController, curve: Curves.elasticOut);
  late AnimationController checkController = AnimationController(
      duration: const Duration(milliseconds: 400), vsync: this);
  late Animation<double> checkAnimation =
      CurvedAnimation(parent: checkController, curve: Curves.linear);

  @override
  void initState() {
    super.initState();
    scaleController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        checkController.forward();
      }
    });
    scaleController.forward();
  }

  @override
  void dispose() {
    scaleController.dispose();
    checkController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: Container(
        height: widget.circleSize,
        width: widget.circleSize,
        decoration: BoxDecoration(
          color: widget.outsideColor,
          shape: BoxShape.circle,
        ),
        child: SizeTransition(
            sizeFactor: checkAnimation,
            axis: Axis.horizontal,
            axisAlignment: -1,
            child: Center(
                child: Icon(
              Icons.check,
              color: widget.insideColor,
              size: widget.iconSize,
            ))),
      ),
    );
  }
}
