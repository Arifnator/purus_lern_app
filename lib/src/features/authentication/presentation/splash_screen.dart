import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/config/gradients.dart';
import 'package:purus_lern_app/src/features/authentication/data/login_conditions.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/forgot_password_place.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/registration_confirm_place.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/registration_place.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/splash_bubbles_background.dart';
import 'package:rive/rive.dart';
import 'package:purus_lern_app/src/core/presentation/home_screen.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/onboarding_place.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/faceid_place.dart';
import 'package:purus_lern_app/src/features/authentication/presentation/auth_routes/login_place.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _routeAnimationController;
  late Animation<double> _fadeAnimation;
  ValueNotifier<String> placeRouteNotifier = ValueNotifier<String>("");
  late Map<String, Widget> authenticationRoutes;

  @override
  void initState() {
    super.initState();

    authenticationRoutes = {
      'Onboarding': OnboardingPlace(transitionToRoute: _transitionToRoute),
      'FaceId': FaceidPlace(transitionToRoute: _transitionToRoute),
      'Login': LoginPlace(transitionToRoute: _transitionToRoute),
      'ForgotPassword':
          ForgotPasswordPlace(transitionToRoute: _transitionToRoute),
      'Registration': RegistrationPlace(transitionToRoute: _transitionToRoute),
      'RegistrationConfirm':
          RegistrationConfirmPlace(transitionToRoute: _transitionToRoute),
    };

    _routeAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _fadeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_routeAnimationController);
    _splashEndRoute();
  }

  void _splashEndRoute() async {
    await Future.delayed(const Duration(milliseconds: 4500));

    if (mounted) {
      if (isLoggedIn) {
        _routeAnimationController.forward();
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: const HomeScreen(),
              );
            },
            transitionDuration: const Duration(milliseconds: 1200),
          ),
        );
      } else {
        if (isOnboardingNotComplete) {
          setState(() {
            placeRouteNotifier.value = 'Onboarding';
          });
        } else if (isFaceIdAvailable) {
          setState(() {
            placeRouteNotifier.value = 'FaceId';
          });
        } else {
          setState(() {
            placeRouteNotifier.value = 'Login';
          });
        }
      }
    }
  }

  void _transitionToRoute(String route) async {
    setState(() {
      placeRouteNotifier.value = '';
    });
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      placeRouteNotifier.value = route;
    });
  }

  @override
  void dispose() {
    _routeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        decoration: MyBackgroundGradient().myBackgroundGradient(),
        child: Stack(
          children: [
            const SplashBubblesBackground(),
            Scaffold(
              // resizeToAvoidBottomInset: false,
              backgroundColor: Colors.transparent,
              body: Center(
                child: Column(
                  children: [
                    const Expanded(
                      flex: 1,
                      child: SizedBox(),
                    ),
                    const Expanded(
                      flex: 3,
                      child: SizedBox(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.0),
                          child: RiveAnimation.asset(
                            'assets/animations/splash_animation_shadow.riv',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: SizedBox(
                        child: ValueListenableBuilder(
                          valueListenable: placeRouteNotifier,
                          builder: (context, route, _) {
                            return AnimatedSwitcher(
                              duration: const Duration(milliseconds: 300),
                              switchInCurve: Curves.easeIn,
                              switchOutCurve: Curves.easeOut,
                              transitionBuilder:
                                  (Widget child, Animation<double> animation) {
                                return FadeTransition(
                                    opacity: animation, child: child);
                              },
                              child: route.isEmpty
                                  ? const SizedBox()
                                  : authenticationRoutes[route],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
