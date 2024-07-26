import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';
import 'package:purus_lern_app/src/config/palette.dart';

// Shadow mit übergang auf schwarz problem

class MyButton extends StatefulWidget {
  const MyButton({
    super.key,
    required this.text,
    this.buttonHeight = 53.0,
    this.buttonWidth = 340.0,
    this.textColor = Colors.white,
    this.bgColor = purusDarkerGreen,
    this.strokeColor = purusGreen,
    this.borderRadius = 43.0,
    this.icon,
  });
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final Color textColor;
  final Color bgColor;
  final Color strokeColor;
  final double borderRadius;
  final Widget? icon;

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shadowAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    _shadowAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onPress() {
    _controller.forward();
  }

  void _onRelease() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    Color innerShadowColor =
        Colors.white.withOpacity(0.25 * _shadowAnimation.value);
    Color pressedShadowColor =
        Colors.black.withOpacity(0.25 * _shadowAnimation.value);

    return GestureDetector(
      onTap: () {
        print("sjsjs");
      },
      onTapDown: (_) => _onPress(),
      onTapUp: (_) => _onRelease(),
      onTapCancel: () => _onRelease(),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: widget.bgColor,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 0.5,
                  strokeAlign: BorderSide.strokeAlignInside,
                  color: widget.strokeColor,
                ),
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              shadows: const [
                BoxShadow(
                  color: Color.fromARGB(88, 0, 0, 0),
                  blurRadius: 10,
                  offset: Offset(5, 5),
                  spreadRadius: 0,
                )
              ],
            ),
            child: InnerShadow(
              shadows: [
                Shadow(
                    color: _controller.isAnimating
                        ? pressedShadowColor
                        : innerShadowColor,
                    blurRadius: 20,
                    offset: const Offset(2, 10))
              ],
              child: Container(
                clipBehavior: Clip.antiAlias,
                width: widget.buttonWidth,
                height: widget.buttonHeight,
                decoration: ShapeDecoration(
                  color: widget.bgColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(widget.borderRadius),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000), // nicht das!
                      blurRadius: 14,
                      offset: Offset(7, 7),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      widget.text,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 21,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500,
                        shadows: [
                          Shadow(
                              color: widget.textColor.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(1, 1))
                        ],
                        height: 0,
                      ),
                    ),
                    widget.icon != null
                        ? const SizedBox(
                            width: 10,
                          )
                        : const SizedBox(),
                    widget.icon ?? const SizedBox(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
