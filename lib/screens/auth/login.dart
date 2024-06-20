// import 'package:flutter/material.dart';
// import '../components/custom_button.dart';

// import '../widgets/top_bar.dart';
// import '../widgets/crypto_view.dart';

// import '../styles/color.dart';
// import '../styles/typo.dart';
// import '../widgets/bottom_nav_bar.dart';
// import '../widgets/card.dart';
// import '../widgets/headline.dart';
// import '../widgets/promo_card.dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Column(
//             children: [
//               //Top Bar
//               const TopBar(),
//               // PromoCard(),
//               const PromoCard(),

//               // New Row
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   height: 40,
//                   decoration: BoxDecoration(
//                     color: white,
//                   ),
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     child: Row(
//                       children: [
//                         Image.asset('assets/images/news.png'),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           'News',
//                           style: small,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Expanded(
//                           child: Text(
//                             'Join the Ocuupa BTC/USDT Trading challenge now',
//                             overflow: TextOverflow.ellipsis,
//                             textAlign: TextAlign.left,
//                             style: small,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),

//               //  Card List View(),
//               const CardListView(),

//               //HeadLine
//               const SHeadline(),
//               const Divider(
//                 thickness: 1,
//               ),

//               //Crypto Header
//               Padding(
//                 padding: const EdgeInsets.only(
//                     left: 25, right: 25, top: 5, bottom: 15),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'Crypto',
//                           style: header,
//                         ),
//                         const SizedBox(
//                           width: 10,
//                         ),
//                         Text(
//                           'Last Price',
//                           style: header,
//                         ),
//                         Text(
//                           'Change',
//                           style: header,
//                         ),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 10,
//                     ),

//                     //CryptoList

//                     CryptoList(
//                       imagePath: 'assets/images/btc.png',
//                       text: 'BTC',
//                       subText: 'Bitcoin',
//                       lastPrice: 40000,
//                       change: ' -3.04% ',
//                       boxColor: red,
//                       textColor: smallPrice,
//                     ),
//                     const SizedBox(height: 16),
//                     CryptoList(
//                       imagePath: 'assets/images/eth.png',
//                       text: 'ETH',
//                       subText: 'Ethereum',
//                       lastPrice: 546,
//                       change: ' -3.04% ',
//                       boxColor: red,
//                       textColor: smallPrice,
//                     ),
//                     const SizedBox(height: 16),
//                     CryptoList(
//                       imagePath: 'assets/images/usd.png',
//                       text: 'USDT',
//                       subText: 'Tether USDT',
//                       lastPrice: 40000,
//                       change: '+0.00% ',
//                       boxColor: green,
//                       textColor: smallPrice,
//                     ),
//                     const SizedBox(height: 16),
//                     CryptoList(
//                       imagePath: 'assets/images/okx.png',
//                       text: 'OCU',
//                       subText: 'Ocuupa Token',
//                       lastPrice: 546,
//                       change: '+25.04%',
//                       boxColor: green,
//                       textColor: smallPrice,
//                     ),
//                     const SizedBox(height: 16),
//                     CryptoList(
//                       imagePath: 'assets/images/ada.png',
//                       text: 'ADA',
//                       subText: 'Cardano',
//                       lastPrice: 40000,
//                       change: ' -3.04% ',
//                       boxColor: red,
//                       textColor: smallPrice,
//                     ),
//                     const SizedBox(height: 16),
//                     CryptoList(
//                       imagePath: 'assets/images/xrp.png',
//                       text: 'XRP',
//                       subText: 'Ripple',
//                       lastPrice: 546,
//                       change: ' -3.04% ',
//                       boxColor: red,
//                       textColor: smallPrice,
//                     ),
//                   ],
//                 ),
//               ),
//               const CustomButton(
//                 text: 'View More',
//                 width: 180,
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         child: SizedBox(
//           height: 56,
//           width: MediaQuery.of(context).size.width,
//           child: Padding(
//             padding: const EdgeInsets.only(left: 25.0, right: 25.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconBottomBar(
//                     text: "Home",
//                     icon: Icons.home,
//                     selected: _selectedIndex == 0,
//                     onPressed: () {
//                       setState(() {
//                         _selectedIndex = 0;
//                       });
//                     }),
//                 IconBottomBar(
//                     text: "Trade",
//                     icon: Icons.track_changes,
//                     selected: _selectedIndex == 1,
//                     onPressed: () {
//                       setState(() {
//                         _selectedIndex = 1;
//                       });
//                     }),
//                 IconBottomBar(
//                     text: "Save",
//                     icon: Icons.save,
//                     selected: _selectedIndex == 2,
//                     onPressed: () {
//                       setState(() {
//                         _selectedIndex = 2;
//                       });
//                     }),
//                 IconBottomBar(
//                     text: "Games",
//                     icon: Icons.games,
//                     selected: _selectedIndex == 3,
//                     onPressed: () {
//                       setState(() {
//                         _selectedIndex = 3;
//                       });
//                     }),
//                 IconBottomBar(
//                     text: "Wallet",
//                     icon: Icons.watch,
//                     selected: _selectedIndex == 4,
//                     onPressed: () {
//                       setState(() {
//                         _selectedIndex = 4;
//                       });
//                     }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




// Text(
//     'Anmelden',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 21,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w510,
//         height: 0,
//     ),
// )
// // ---
// Text(
//     'Bitte melden Sie sich an.',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Color(0xFF8A8A8E),
//         fontSize: 15,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0.10,
//         letterSpacing: -0.40,
//     ),
// )
// // ---
// Text(
//     'Registrieren',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Color(0xFF008159),
//         fontSize: 21,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w510,
//         height: 0,
//     ),
// )
// // ---
// Text(
//     'Passwort',
//     style: TextStyle(
//         color: Color(0xFF8A8A8E),
//         fontSize: 17,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w400,
//         height: 0.08,
//         letterSpacing: -0.40,
//     ),
// )
// // ---
// Text(
//     'E-Mail Adresse',
//     style: TextStyle(
//         color: Color(0xFF8A8A8E),
//         fontSize: 17,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w400,
//         height: 0.08,
//         letterSpacing: -0.40,
//     ),
// )
// // ---
// Text(
//     'Angemeldet bleiben',
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 11,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0.18,
//         letterSpacing: -0.40,
//     ),
// )
// // ---
// Text(
//     'Passwort vergessen?',
//     textAlign: TextAlign.right,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 11,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0.18,
//         letterSpacing: -0.40,
//     ),
// )
// // ---
// Text(
//     '9:41',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.black,
//         fontSize: 17,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0.08,
//     ),
// )
// // ---
// Text(
//     'oder',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 11,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w590,
//         height: 0,
//     ),
// )
// // ---
// Text(
//     '􀎽',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 43.89,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w274,
//         height: 0,
//     ),
// )
// // ---
// Text(
//     'Face ID',
//     textAlign: TextAlign.center,
//     style: TextStyle(
//         color: Colors.white,
//         fontSize: 10.36,
//         fontFamily: 'SF Pro',
//         fontWeight: FontWeight.w400,
//         height: 0.12,
//         letterSpacing: -0.24,
//     ),
// )













// Container(
//     width: 393,
//     height: 852,
//     clipBehavior: Clip.antiAlias,
//     decoration: BoxDecoration(
//         gradient: LinearGradient(
//             begin: Alignment(0.00, -1.00),
//             end: Alignment(0, 1),
//             colors: [Colors.white, Color(0xFF008159), Color(0xFF003826)],
//         ),
//     ),
//     child: Stack(
//         children: [
//             Positioned(
//                 left: 27,
//                 top: 562,
//                 child: Container(
//                     width: 340,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 0.30,
//                                 strokeAlign: BorderSide.strokeAlignCenter,
//                                 color: Color(0xFF8A8A8E),
//                             ),
//                             borderRadius: BorderRadius.circular(43),
//                         ),
//                         shadows: [
//                             BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 14.40,
//                                 offset: Offset(7, 7),
//                                 spreadRadius: 0,
//                             )
//                         ],
//                     ),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Expanded(
//                                 child: Container(
//                                     height: 53,
//                                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                         color: Color(0xFF008159),
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(43),
//                                         ),
//                                     ),
//                                     child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                             Expanded(
//                                                 child: SizedBox(
//                                                     child: Text(
//                                                         'Anmelden',
//                                                         textAlign: TextAlign.center,
//                                                         style: TextStyle(
//                                                             color: Colors.white,
//                                                             fontSize: 21,
//                                                             fontFamily: 'SF Pro',
//                                                             fontWeight: FontWeight.w510,
//                                                             height: 0,
//                                                         ),
//                                                     ),
//                                                 ),
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 0,
//                 top: 320,
//                 child: Container(
//                     width: 393,
//                     padding: const EdgeInsets.symmetric(horizontal: 55),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Expanded(
//                                 child: Container(
//                                     height: 22,
//                                     child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                             Expanded(
//                                                 child: SizedBox(
//                                                     child: Text(
//                                                         'Bitte melden Sie sich an.',
//                                                         textAlign: TextAlign.center,
//                                                         style: TextStyle(
//                                                             color: Color(0xFF8A8A8E),
//                                                             fontSize: 15,
//                                                             fontFamily: 'SF Pro',
//                                                             fontWeight: FontWeight.w590,
//                                                             height: 0.10,
//                                                             letterSpacing: -0.40,
//                                                         ),
//                                                     ),
//                                                 ),
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 27,
//                 top: 668,
//                 child: Container(
//                     width: 340,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                                 width: 0.30,
//                                 strokeAlign: BorderSide.strokeAlignCenter,
//                                 color: Color(0xFF8A8A8E),
//                             ),
//                             borderRadius: BorderRadius.circular(43),
//                         ),
//                         shadows: [
//                             BoxShadow(
//                                 color: Color(0x3F000000),
//                                 blurRadius: 14.40,
//                                 offset: Offset(7, 7),
//                                 spreadRadius: 0,
//                             )
//                         ],
//                     ),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Expanded(
//                                 child: Container(
//                                     height: 53,
//                                     padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//                                     clipBehavior: Clip.antiAlias,
//                                     decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(43),
//                                         ),
//                                     ),
//                                     child: Row(
//                                         mainAxisSize: MainAxisSize.min,
//                                         mainAxisAlignment: MainAxisAlignment.center,
//                                         crossAxisAlignment: CrossAxisAlignment.center,
//                                         children: [
//                                             Expanded(
//                                                 child: SizedBox(
//                                                     child: Text(
//                                                         'Registrieren',
//                                                         textAlign: TextAlign.center,
//                                                         style: TextStyle(
//                                                             color: Color(0xFF008159),
//                                                             fontSize: 21,
//                                                             fontFamily: 'SF Pro',
//                                                             fontWeight: FontWeight.w510,
//                                                             height: 0,
//                                                         ),
//                                                     ),
//                                                 ),
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 27,
//                 top: 436,
//                 child: Container(
//                     height: 54,
//                     child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Container(
//                                 width: double.infinity,
//                                 height: 54,
//                                 padding: const EdgeInsets.only(left: 30, right: 18),
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 0.30,
//                                             strokeAlign: BorderSide.strokeAlignCenter,
//                                             color: Color(0xFF8A8A8E),
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     shadows: [
//                                         BoxShadow(
//                                             color: Color(0x33000000),
//                                             blurRadius: 32,
//                                             offset: Offset(0, 0),
//                                             spreadRadius: 0,
//                                         )
//                                     ],
//                                 ),
//                                 child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                         Container(
//                                             height: 54,
//                                             padding: const EdgeInsets.only(top: 16, right: 181, bottom: 16),
//                                             clipBehavior: Clip.antiAlias,
//                                             decoration: BoxDecoration(),
//                                             child: Row(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                     Text(
//                                                         'Passwort',
//                                                         style: TextStyle(
//                                                             color: Color(0xFF8A8A8E),
//                                                             fontSize: 17,
//                                                             fontFamily: 'SF Pro',
//                                                             fontWeight: FontWeight.w400,
//                                                             height: 0.08,
//                                                             letterSpacing: -0.40,
//                                                         ),
//                                                     ),
//                                                 ],
//                                             ),
//                                         ),
//                                         const SizedBox(width: 10),
//                                         Container(
//                                             width: 40,
//                                             height: 40,
//                                             child: Column(
//                                                 mainAxisSize: MainAxisSize.min,
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                                 children: [
//                                                     Container(
//                                                         width: 19,
//                                                         height: 12,
//                                                         child: FlutterLogo(),
//                                                     ),
//                                                 ],
//                                             ),
//                                         ),
//                                     ],
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 27,
//                 top: 362,
//                 child: Container(
//                     height: 54,
//                     child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Container(
//                                 width: double.infinity,
//                                 height: 54,
//                                 padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
//                                 clipBehavior: Clip.antiAlias,
//                                 decoration: ShapeDecoration(
//                                     color: Colors.white,
//                                     shape: RoundedRectangleBorder(
//                                         side: BorderSide(
//                                             width: 0.30,
//                                             strokeAlign: BorderSide.strokeAlignCenter,
//                                             color: Color(0xFF8A8A8E),
//                                         ),
//                                         borderRadius: BorderRadius.circular(12),
//                                     ),
//                                     shadows: [
//                                         BoxShadow(
//                                             color: Color(0x33000000),
//                                             blurRadius: 32,
//                                             offset: Offset(0, 0),
//                                             spreadRadius: 0,
//                                         )
//                                     ],
//                                 ),
//                                 child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                         Expanded(
//                                             child: Container(
//                                                 height: double.infinity,
//                                                 clipBehavior: Clip.antiAlias,
//                                                 decoration: BoxDecoration(),
//                                                 child: Row(
//                                                     mainAxisSize: MainAxisSize.min,
//                                                     mainAxisAlignment: MainAxisAlignment.start,
//                                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                                     children: [
//                                                         Text(
//                                                             'E-Mail Adresse',
//                                                             style: TextStyle(
//                                                                 color: Color(0xFF8A8A8E),
//                                                                 fontSize: 17,
//                                                                 fontFamily: 'SF Pro',
//                                                                 fontWeight: FontWeight.w400,
//                                                                 height: 0.08,
//                                                                 letterSpacing: -0.40,
//                                                             ),
//                                                         ),
//                                                     ],
//                                                 ),
//                                             ),
//                                         ),
//                                     ],
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 37,
//                 top: 510,
//                 child: Container(
//                     width: 319,
//                     height: 32,
//                     padding: const EdgeInsets.symmetric(vertical: 5),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                             Expanded(
//                                 child: Container(
//                                     height: double.infinity,
//                                     child: Stack(
//                                         children: [
//                                             Positioned(
//                                                 left: 0,
//                                                 top: 2,
//                                                 child: Container(
//                                                     width: 18,
//                                                     height: 18,
//                                                     child: Column(
//                                                         mainAxisSize: MainAxisSize.min,
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                         ,
//                                                         ],
//                                                     ),
//                                                 ),
//                                             ),
//                                             Positioned(
//                                                 left: 27,
//                                                 top: 0,
//                                                 child: SizedBox(
//                                                     width: 113,
//                                                     child: Text(
//                                                         'Angemeldet bleiben',
//                                                         style: TextStyle(
//                                                             color: Colors.white,
//                                                             fontSize: 11,
//                                                             fontFamily: 'SF Pro',
//                                                             fontWeight: FontWeight.w590,
//                                                             height: 0.18,
//                                                             letterSpacing: -0.40,
//                                                         ),
//                                                     ),
//                                                 ),
//                                             ),
//                                         ],
//                                     ),
//                                 ),
//                             ),
//                             const SizedBox(width: 60),
//                             SizedBox(
//                                 width: 119,
//                                 child: Text(
//                                     'Passwort vergessen?',
//                                     textAlign: TextAlign.right,
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontSize: 11,
//                                         fontFamily: 'SF Pro',
//                                         fontWeight: FontWeight.w590,
//                                         height: 0.18,
//                                         letterSpacing: -0.40,
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 0,
//                 top: 0,
//                 child: Container(
//                     width: 393,
//                     height: 54,
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                             Container(
//                                 height: 54,
//                                 padding: const EdgeInsets.only(top: 18.34, bottom: 13.66),
//                                 child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.center,
//                                     children: [
//                                         SizedBox(
//                                             width: 37,
//                                             child: Text(
//                                                 '9:41',
//                                                 textAlign: TextAlign.center,
//                                                 style: TextStyle(
//                                                     color: Colors.black,
//                                                     fontSize: 17,
//                                                     fontFamily: 'SF Pro',
//                                                     fontWeight: FontWeight.w590,
//                                                     height: 0.08,
//                                                 ),
//                                             ),
//                                         ),
//                                     ],
//                                 ),
//                             ),
//                             Container(
//                                 width: 143,
//                                 height: 54,
//                                 child: FlutterLogo(),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 0,
//                 top: 831,
//                 child: Container(
//                     width: 393,
//                     height: 21,
//                     padding: const EdgeInsets.symmetric(horizontal: 127),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Transform(
//                                 transform: Matrix4.identity()..translate(0.0, 0.0)..rotateZ(3.14),
//                                 child: Container(
//                                     width: 139,
//                                     height: 5,
//                                     decoration: ShapeDecoration(
//                                         color: Colors.white,
//                                         shape: RoundedRectangleBorder(
//                                             borderRadius: BorderRadius.circular(100),
//                                         ),
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 50,
//                 top: 635,
//                 child: Container(
//                     width: 294,
//                     clipBehavior: Clip.antiAlias,
//                     decoration: BoxDecoration(),
//                     child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             const SizedBox(width: 19),
//                             Text(
//                                 'oder',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 11,
//                                     fontFamily: 'SF Pro',
//                                     fontWeight: FontWeight.w590,
//                                     height: 0,
//                                 ),
//                             ),
//                             const SizedBox(width: 19),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 157,
//                 top: 734,
//                 child: Container(
//                     padding: const EdgeInsets.only(
//                         top: 5,
//                         left: 13,
//                         right: 15,
//                         bottom: 4.27,
//                     ),
//                     clipBehavior: Clip.antiAlias,
//                     decoration: ShapeDecoration(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(4.88),
//                         ),
//                     ),
//                     child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                             Text(
//                                 '􀎽',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 43.89,
//                                     fontFamily: 'SF Pro',
//                                     fontWeight: FontWeight.w274,
//                                     height: 0,
//                                 ),
//                             ),
//                             const SizedBox(height: 7.73),
//                             Text(
//                                 'Face ID',
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10.36,
//                                     fontFamily: 'SF Pro',
//                                     fontWeight: FontWeight.w400,
//                                     height: 0.12,
//                                     letterSpacing: -0.24,
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//             Positioned(
//                 left: 48,
//                 top: 119,
//                 child: Container(
//                     width: 297,
//                     height: 158,
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                             BoxShadow(
//                                 color: Color(0x2B000000),
//                                 blurRadius: 11.60,
//                                 offset: Offset(6, 5),
//                                 spreadRadius: 5,
//                             )
//                         ],
//                     ),
//                     child: Stack(
//                         children: [
//                             Positioned(
//                                 left: 18.71,
//                                 top: 54.36,
//                                 child: Container(
//                                     width: 158.76,
//                                     height: 44.09,
//                                     decoration: BoxDecoration(color: Colors.white),
//                                 ),
//                             ),
//                             Positioned(
//                                 left: 180.49,
//                                 top: 51.94,
//                                 child: Container(
//                                     width: 97.19,
//                                     height: 50.74,
//                                     decoration: BoxDecoration(
//                                         image: DecorationImage(
//                                             image: NetworkImage("https://via.placeholder.com/97x51"),
//                                             fit: BoxFit.fill,
//                                         ),
//                                     ),
//                                 ),
//                             ),
//                         ],
//                     ),
//                 ),
//             ),
//         ],
//     ),
// )