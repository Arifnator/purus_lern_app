import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/features/mainmenu/presentation/mainmenu_screen.dart';

// 590 zu 600 -- 210 zu 200 -- 510 zu 500

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.00, -1.00),
            end: Alignment(0, 1),
            colors: [Colors.white, Color(0xFF008159), Color(0xFF003826)],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 27,
              top: 562,
              child: Container(
                width: 340,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.30,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF8A8A8E),
                    ),
                    borderRadius: BorderRadius.circular(43),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 14.40,
                      offset: Offset(7, 7),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MainmenuScreen()),
                          );
                        },
                        child: Container(
                          height: 53,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 14),
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: const Color(0xFF008159),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(43),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: Text(
                                    'Anmelden',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 21,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 320,
              child: Container(
                width: 393,
                padding: const EdgeInsets.symmetric(horizontal: 55),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 22,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Bitte melden Sie sich an.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF8A8A8E),
                                    fontSize: 15,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 0.10,
                                    letterSpacing: -0.40,
                                  ),
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
            ),
            Positioned(
              left: 27,
              top: 668,
              child: Container(
                width: 340,
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                      width: 0.30,
                      strokeAlign: BorderSide.strokeAlignCenter,
                      color: Color(0xFF8A8A8E),
                    ),
                    borderRadius: BorderRadius.circular(43),
                  ),
                  shadows: const [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 14.40,
                      offset: Offset(7, 7),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 53,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 14),
                        clipBehavior: Clip.antiAlias,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(43),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Registrieren',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF008159),
                                    fontSize: 21,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w500,
                                    height: 0,
                                  ),
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
            ),
            Positioned(
              left: 27,
              top: 436,
              child: SizedBox(
                height: 54,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 54,
                      padding: const EdgeInsets.only(left: 30, right: 18),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.30,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF8A8A8E),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 32,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 54,
                            padding: const EdgeInsets.only(
                                top: 16, right: 181, bottom: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: const BoxDecoration(),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Passwort',
                                  style: TextStyle(
                                    color: Color(0xFF8A8A8E),
                                    fontSize: 17,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w400,
                                    height: 0.08,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 10),
                          const SizedBox(
                            width: 40,
                            height: 40,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 19,
                                  height: 12,
                                  child: FlutterLogo(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 27,
              top: 362,
              child: SizedBox(
                height: 54,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 54,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.30,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFF8A8A8E),
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x33000000),
                            blurRadius: 32,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'E-Mail Adresse',
                                    style: TextStyle(
                                      color: Color(0xFF8A8A8E),
                                      fontSize: 17,
                                      fontFamily: 'SF Pro',
                                      fontWeight: FontWeight.w400,
                                      height: 0.08,
                                      letterSpacing: -0.40,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 37,
              top: 510,
              child: Container(
                width: 319,
                height: 32,
                padding: const EdgeInsets.symmetric(vertical: 5),
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              top: 2,
                              child: SizedBox(
                                width: 18,
                                height: 18,
                                // ignore: prefer_const_constructors
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [],
                                ),
                              ),
                            ),
                            Positioned(
                              left: 27,
                              top: 0,
                              child: SizedBox(
                                width: 113,
                                child: Text(
                                  'Angemeldet bleiben',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 11,
                                    fontFamily: 'SF Pro',
                                    fontWeight: FontWeight.w600,
                                    height: 0.18,
                                    letterSpacing: -0.40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 60),
                    SizedBox(
                      width: 119,
                      child: Text(
                        'Passwort vergessen?',
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontFamily: 'SF Pro',
                          fontWeight: FontWeight.w600,
                          height: 0.18,
                          letterSpacing: -0.40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 50,
              top: 635,
              child: Container(
                width: 294,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 19),
                    Text(
                      'oder',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    SizedBox(width: 19),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 157,
              top: 734,
              child: Container(
                padding: const EdgeInsets.only(
                  top: 5,
                  left: 13,
                  right: 15,
                  bottom: 4.27,
                ),
                clipBehavior: Clip.antiAlias,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.88),
                  ),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '􀎽',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 43.89,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w200,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 7.73),
                    Text(
                      'Face ID',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10.36,
                        fontFamily: 'SF Pro',
                        fontWeight: FontWeight.w400,
                        height: 0.12,
                        letterSpacing: -0.24,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 48,
              top: 119,
              child: Container(
                width: 297,
                height: 158,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x2B000000),
                      blurRadius: 11.60,
                      offset: Offset(6, 5),
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 18.71,
                      top: 54.36,
                      child: Container(
                        width: 158.76,
                        height: 44.09,
                        decoration: const BoxDecoration(color: Colors.white),
                      ),
                    ),
                    Positioned(
                      left: 180.49,
                      top: 51.94,
                      child: Container(
                        width: 97.19,
                        height: 50.74,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: ExactAssetImage(
                                "assets/images/LogoHellgrün.png"),
                            fit: BoxFit.fill,
                          ),
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
