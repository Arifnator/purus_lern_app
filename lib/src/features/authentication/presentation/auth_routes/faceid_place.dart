import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/features/authentication/application/local_auth_service.dart';
import 'package:purus_lern_app/src/widgets/my_snack_bar.dart';
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

  final LocalAuthService _localAuthService = LocalAuthService();
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();

    _checkBiometrics();

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

  Future<void> _checkBiometrics() async {
    setState(() {
      _isAuthenticating = true;
    });

    bool isBiometricAvailable = await _localAuthService.isBiometricAvailable();

    if (isBiometricAvailable) {
      bool authenticated = await _localAuthService.authenticateUser();
      setState(() {
        _isAuthenticating = false;
      });
      if (authenticated) {
        widget.transitionToRoute("Login");
      } else {
        if (mounted) {
          mySnackbar(context, "Fehler beim biometrischen Anmeldeverfahren.");
        }
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    _checkBiometrics();
                  },
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: SizedBox(
                      height: 160,
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
          ),
          if (_isAuthenticating)
            Positioned(
              top: 0,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
