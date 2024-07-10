import 'package:flutter/material.dart';

// alle weights mit 510 wurden auf 500 geändert!

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 177.76,
              padding: const EdgeInsets.only(
                top: 70,
                left: 35,
                right: 35,
                bottom: 15,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0x358A8A8E),
                  ),
                  top: BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0x358A8A8E),
                  ),
                  right: BorderSide(
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0x358A8A8E),
                  ),
                  bottom: BorderSide(
                    width: 1,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0x358A8A8E),
                  ),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 82,
                    height: 82,
                    decoration: const ShapeDecoration(
                      image: DecorationImage(
                        image: ExactAssetImage('assets/images/Ellipse64.png'),
                        fit: BoxFit.fill,
                      ),
                      shape: OvalBorder(),
                      shadows: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 32,
                          offset: Offset(0, 0),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: const BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x3F000000),
                            blurRadius: 6.27,
                            offset: Offset(2.24, 2.06),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Willkommen',
                                style: TextStyle(
                                  color: Color(0xFF8A8A8E),
                                  fontSize: 24,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.04,
                                  letterSpacing: -0.45,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 46.38,
                            child: Text(
                              'Herr Arif Ayduran!',
                              style: TextStyle(
                                color: Color(0xFF8A8A8E),
                                fontSize: 11,
                                fontFamily: 'SF Pro',
                                fontWeight: FontWeight.w500,
                                height: 0.20,
                                letterSpacing: -0.45,
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
            Expanded(
              child: Container(
                width: 361,
                padding:
                    const EdgeInsets.symmetric(horizontal: 27, vertical: 15),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 32,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  alignment: WrapAlignment.center,
                  children: [
                    Container(
                      width: 293,
                      height: 139,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.29),
                        ),
                      ),
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 0,
                            top: 0.24,
                            child: SizedBox(
                              width: 293,
                              height: 26,
                              child: Text(
                                'Lernvideo fortsetzen / Nächstes Lernvideo',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF999797),
                                  fontSize: 9.50,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.21,
                                  letterSpacing: -0.36,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 109.16,
                            top: 31.89,
                            child: Container(
                              width: 180.84,
                              height: 102.13,
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 0.94,
                                    color: Colors.black
                                        .withOpacity(0.15000000596046448),
                                  ),
                                  borderRadius: BorderRadius.circular(18.74),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Container(
                                      height: double.infinity,
                                      padding: const EdgeInsets.only(
                                        top: 22.57,
                                        left: 61.57,
                                        right: 62.41,
                                        bottom: 22.70,
                                      ),
                                      decoration: const BoxDecoration(
                                          color: Color(0x28008159)),
                                      child: const Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            width: 56.86,
                                            height: 56.86,
                                            child: Text(
                                              '􀊄',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Color(0xBF008159),
                                                fontSize: 36.39,
                                                fontFamily: 'SF Pro',
                                                fontWeight: FontWeight.w400,
                                                height: 0.02,
                                                letterSpacing: -0.45,
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
                            left: 0,
                            top: 26.24,
                            child: Container(
                              width: 109,
                              height: 113,
                              padding: const EdgeInsets.only(
                                  top: 9, left: 21.59, bottom: 9),
                              child: const Column(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Kapitel:',
                                      style: TextStyle(
                                        color: Color(0xFF999797),
                                        fontSize: 7.20,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w700,
                                        height: 0.35,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'klaksöja aföajföjaaföajföja aföajföjaaföajföjaaföajföja aföajföjaaföajföjaaföajföja',
                                      style: TextStyle(
                                        color: Color(0xFF999797),
                                        fontSize: 5.40,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w400,
                                        height: 0.31,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                      'Thema:',
                                      style: TextStyle(
                                        color: Color(0xFF999797),
                                        fontSize: 7.20,
                                        fontFamily: 'SF Pro',
                                        fontWeight: FontWeight.w700,
                                        height: 0.35,
                                        letterSpacing: -0.36,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: Text(
                                        'DDKALJFLÖAasflaölf lamflmas ajfljhaflksjlkfj alksjflkajfv yckyxkvo ',
                                        style: TextStyle(
                                          color: Color(0xFF999797),
                                          fontSize: 5.40,
                                          fontFamily: 'SF Pro',
                                          fontWeight: FontWeight.w400,
                                          height: 0.31,
                                          letterSpacing: -0.36,
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
                    const SizedBox(width: 15),
                    Container(
                      width: 139,
                      height: 139,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.31),
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: -0,
                            top: 0,
                            child: SizedBox(
                              width: 139,
                              height: 25.04,
                              child: Text(
                                'Lernfortschritt',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF999797),
                                  fontSize: 9.50,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.21,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 25.90,
                            top: 38.85,
                            child: SizedBox(
                              width: 88.06,
                              height: 88.06,
                              child: Stack(
                                children: [
                                  Positioned(
                                    left: 0.01,
                                    top: 0.02,
                                    child: SizedBox(
                                      width: 88.06,
                                      height: 88.06,
                                      child: Stack(),
                                    ),
                                  ),
                                  Positioned(
                                    left: 29.35,
                                    top: 37.12,
                                    child: SizedBox(
                                      width: 29.35,
                                      height: 14.68,
                                      child: Text(
                                        '47%',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.95,
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
                    const SizedBox(width: 15),
                    Container(
                      width: 139,
                      height: 139,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.31),
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: -0,
                            top: 0,
                            child: SizedBox(
                              width: 139,
                              height: 25.04,
                              child: Text(
                                'Lexikon',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF999797),
                                  fontSize: 9.50,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.21,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 27.63,
                            top: 37.13,
                            child: SizedBox(
                              width: 84.57,
                              height: 84.57,
                              child: FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 139,
                      height: 139,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.31),
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 139,
                              height: 25.04,
                              child: Text(
                                'Lernmenü',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF999797),
                                  fontSize: 9.50,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.21,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 30.23,
                            top: 42.30,
                            child: SizedBox(
                              width: 79.43,
                              height: 70.80,
                              child: FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      width: 139,
                      height: 139,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(23.31),
                        ),
                      ),
                      child: const Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 139,
                              height: 25.04,
                              child: Text(
                                'Profilmenü',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF999797),
                                  fontSize: 9.50,
                                  fontFamily: 'SF Pro',
                                  fontWeight: FontWeight.w500,
                                  height: 0.21,
                                  letterSpacing: -0.35,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 42.31,
                            top: 42.31,
                            child: SizedBox(
                              width: 55.25,
                              height: 75.11,
                              child: FlutterLogo(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 94,
              padding: const EdgeInsets.only(left: 52, right: 52, bottom: 21),
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.00, -1.00),
                  end: Alignment(0, 1),
                  colors: [
                    Color(0xFF338771),
                    Color(0xFF137257),
                    Color(0xFF003826)
                  ],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(33),
                ),
                shadows: [
                  const BoxShadow(
                    color: Color(0x23000000),
                    blurRadius: 20.40,
                    offset: Offset(0, -5),
                    spreadRadius: 27,
                  )
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 45,
                    height: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 27.93,
                          height: 27.93,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x4C000000),
                                blurRadius: 2.94,
                                offset: Offset(5.88, 5.88),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                          child: const FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                    height: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 19,
                          height: 17,
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                    height: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 19,
                          height: 19,
                          child: FlutterLogo(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 45,
                    height: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 19,
                          height: 21.12,
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
    );
  }
}
