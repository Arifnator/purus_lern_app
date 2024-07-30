import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/widgets/my_text_button.dart';

class FaceidPlace extends StatefulWidget {
  const FaceidPlace({super.key, required this.transitionToRoute});
  final void Function(String route) transitionToRoute;

  @override
  State<FaceidPlace> createState() => _FaceidPlaceState();
}

class _FaceidPlaceState extends State<FaceidPlace>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(height: 30),
          GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (context) => Dialog());
            },
            child: ScaleTransition(
              scale: _scaleAnimation,
              child: SizedBox(
                height: 140,
                child: Image.asset("assets/images/FaceID.png"),
              ),
            ),
          ),
          MyTextButton(
            text: "Ohne FaceID anmelden",
            onPressed: () {
              widget.transitionToRoute("Login");
            },
          ),
        ],
      ),
    );
  }
}
