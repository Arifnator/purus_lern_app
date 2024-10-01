// import 'dart:ui';
// import 'package:flutter/material.dart';

// class BlurGradient extends StatelessWidget {
//   const BlurGradient({
//     super.key,
//     required this.startColor,
//     required this.height,
//     required this.width,
//     required this.blurTotal,
//     this.endColor = Colors.transparent,
//     this.reverse = false,
//   });

//   final Color startColor;
//   final Color endColor;
//   final double blurTotal;
//   final double height;
//   final double width;
//   final bool reverse;

//   @override
//   Widget build(BuildContext context) {
//     final double blurStep = blurTotal / 4;

//     return Container(
//       height: height,
//       decoration: BoxDecoration(
//         gradient: LinearGradient(
//           begin: reverse ? Alignment.bottomCenter : Alignment.topCenter,
//           end: reverse ? Alignment.topCenter : Alignment.bottomCenter,
//           colors: [startColor, endColor],
//         ),
//       ),
//       child: Column(
//         children: List.generate(4, (index) {
//           final double sigma =
//               reverse ? blurStep * (4 - index) : blurStep * (index + 1);

//           return Expanded(
//             child: ClipRRect(
//               clipBehavior: Clip.antiAlias,
//               child: BackdropFilter(
//                 filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
//                 child: SizedBox(
//                   width: width,
//                 ),
//               ),
//             ),
//           );
//         }).reversed.toList(),
//       ),
//     );
//   }
// }
