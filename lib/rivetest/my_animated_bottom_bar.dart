import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purus_lern_app/src/config/theme.dart';
import 'package:rive/rive.dart';

class MyAnimatedBottomAppBar extends StatefulWidget {
  const MyAnimatedBottomAppBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  @override
  State<MyAnimatedBottomAppBar> createState() => _MyAnimatedBottomAppBarState();
}

class _MyAnimatedBottomAppBarState extends State<MyAnimatedBottomAppBar> {
  SMIInput<bool>? _homeInput;
  SMIInput<bool>? _eduInput;
  SMIInput<bool>? _lexiInput;
  SMIInput<bool>? _settingsInput;
  Artboard? _homeArtboard;
  Artboard? _eduArtboard;
  Artboard? _lexiArtboard;
  Artboard? _settingsArtboard;

  @override
  void initState() {
    super.initState();
    _loadRiveFile('assets/animations/home.riv', (artboard, input) {
      _homeArtboard = artboard;
      _homeInput = input;
      _homeInput!.value = true;
    });
    _loadRiveFile('assets/animations/home.riv', (artboard, input) {
      _eduArtboard = artboard;
      _eduInput = input;
      _eduInput!.value = false;
    });
    _loadRiveFile('assets/animations/home.riv', (artboard, input) {
      _lexiArtboard = artboard;
      _lexiInput = input;
      _lexiInput!.value = false;
    });
    _loadRiveFile('assets/animations/home.riv', (artboard, input) {
      _settingsArtboard = artboard;
      _settingsInput = input;
      _settingsInput!.value = false;
    });
  }

  Future<void> _loadRiveFile(String assetPath,
      void Function(Artboard, SMIInput<bool>?) callback) async {
    await RiveFile.initialize(); // Ensure Rive is initialized
    final data = await rootBundle.load(assetPath);
    final file = RiveFile.import(data);
    final artboard = file.mainArtboard;
    final controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');
    if (controller != null) {
      artboard.addController(controller);
      final input = controller.findInput<bool>('status');
      callback(artboard, input);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 94,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 21),
      decoration: const ShapeDecoration(
        gradient: bottomBarGradient,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(27),
            topLeft: Radius.circular(27),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Color(0x23000000),
            blurRadius: 30,
            offset: Offset(0, -1),
            spreadRadius: 5,
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyBottomAppBarItem(
              artboard: _homeArtboard,
              currentIndex: widget.currentIndex,
              tabIndex: 0,
              input: _homeInput,
              cb: () => widget.onTabSelected(0),
            ),
            MyBottomAppBarItem(
              artboard: _eduArtboard,
              currentIndex: widget.currentIndex,
              tabIndex: 1,
              input: _eduInput,
              cb: () => widget.onTabSelected(1),
            ),
            MyBottomAppBarItem(
              artboard: _lexiArtboard,
              currentIndex: widget.currentIndex,
              tabIndex: 2,
              input: _lexiInput,
              cb: () => widget.onTabSelected(2),
            ),
            MyBottomAppBarItem(
              artboard: _settingsArtboard,
              currentIndex: widget.currentIndex,
              tabIndex: 3,
              input: _settingsInput,
              cb: () => widget.onTabSelected(3),
            ),
          ],
        ),
      ),
    );
  }
}

class MyBottomAppBarItem extends StatelessWidget {
  const MyBottomAppBarItem({
    super.key,
    required this.artboard,
    required this.cb,
    required this.currentIndex,
    required this.tabIndex,
    required this.input,
  });

  final Artboard? artboard;
  final VoidCallback cb;
  final int currentIndex;
  final int tabIndex;
  final SMIInput<bool>? input;

  @override
  Widget build(BuildContext context) {
    if (input != null) {
      input!.value = currentIndex == tabIndex;
    }
    return Flexible(
      fit: FlexFit.tight,
      child: GestureDetector(
        onTap: cb,
        child: artboard == null ? const SizedBox() : Rive(artboard: artboard!),
      ),
    );
  }
}



// ALTE VERSION CH

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:purus_lern_app/src/config/theme.dart';
// import 'package:rive/rive.dart';

// class MyAnimatedBottomAppBar extends StatefulWidget {
//   const MyAnimatedBottomAppBar({super.key});

//   @override
//   State<MyAnimatedBottomAppBar> createState() => _MyAnimatedBottomAppBarState();
// }

// class _MyAnimatedBottomAppBarState extends State<MyAnimatedBottomAppBar> {
//   SMIInput<bool>? _homeInput;
//   SMIInput<bool>? _eduInput;
//   SMIInput<bool>? _lexiInput;
//   SMIInput<bool>? _settingsInput;
//   Artboard? _homeArtboard;
//   Artboard? _eduArtboard;
//   Artboard? _lexiArtboard;
//   Artboard? _settingsArtboard;

//   int _currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     // home
//     rootBundle
//         .load(
//       "assets/animations/home.riv",
//     )
//         .then((data) async {
//       final file = RiveFile.import(data);
//       final artboard = file.mainArtboard;
//       final controller =
//           StateMachineController.fromArtboard(artboard, "State Machine 1");

//       if (controller != null) {
//         artboard.addController(controller);
//         _homeInput = controller.findInput<bool>("status");
//         _homeInput!.value = true;
//       }
//       _homeArtboard = artboard;
//     });
//     // education
//     rootBundle
//         .load(
//       "assets/animations/home.riv",
//     )
//         .then((data) async {
//       final file = RiveFile.import(data);
//       final artboard = file.mainArtboard;
//       final controller =
//           StateMachineController.fromArtboard(artboard, "State Machine 1");

//       if (controller != null) {
//         artboard.addController(controller);
//         _eduInput = controller.findInput<bool>("status");
//         _eduInput!.value = true;
//       }
//       _eduArtboard = artboard;
//     });
//     // lexicon
//     rootBundle
//         .load(
//       "assets/animations/home.riv",
//     )
//         .then((data) async {
//       final file = RiveFile.import(data);
//       final artboard = file.mainArtboard;
//       final controller =
//           StateMachineController.fromArtboard(artboard, "State Machine 1");

//       if (controller != null) {
//         artboard.addController(controller);
//         _lexiInput = controller.findInput<bool>("status");
//         _lexiInput!.value = true;
//       }
//       _lexiArtboard = artboard;
//     });
//     // settings
//     rootBundle
//         .load(
//       "assets/animations/home.riv",
//     )
//         .then((data) async {
//       final file = RiveFile.import(data);
//       final artboard = file.mainArtboard;
//       final controller =
//           StateMachineController.fromArtboard(artboard, "State Machine 1");

//       if (controller != null) {
//         artboard.addController(controller);
//         _settingsInput = controller.findInput<bool>("status");
//         _settingsInput!.value = true;
//       }
//       _settingsArtboard = artboard;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 94,
//       padding: const EdgeInsets.only(left: 20, right: 20, bottom: 21),
//       decoration: const ShapeDecoration(
//         gradient: bottomBarGradient,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//             topRight: Radius.circular(27),
//             topLeft: Radius.circular(27),
//           ),
//         ),
//         shadows: [
//           BoxShadow(
//             color: Color(0x23000000),
//             blurRadius: 30,
//             offset: Offset(0, -1),
//             spreadRadius: 5,
//           )
//         ],
//       ),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             MyBottomAppBarItem(
//               artboard: _homeArtboard,
//               currentIndex: _currentIndex,
//               tabIndex: 0,
//               input: _homeInput,
//               cb: () => setState(
//                 () {
//                   _currentIndex = 0;
//                 },
//               ),
//             ),
//             MyBottomAppBarItem(
//               artboard: _eduArtboard,
//               currentIndex: _currentIndex,
//               tabIndex: 1,
//               input: _eduInput,
//               cb: () => setState(
//                 () {
//                   _currentIndex = 1;
//                 },
//               ),
//             ),
//             MyBottomAppBarItem(
//               artboard: _lexiArtboard,
//               currentIndex: _currentIndex,
//               tabIndex: 2,
//               input: _lexiInput,
//               cb: () => setState(
//                 () {
//                   _currentIndex = 2;
//                 },
//               ),
//             ),
//             MyBottomAppBarItem(
//               artboard: _settingsArtboard,
//               currentIndex: _currentIndex,
//               tabIndex: 3,
//               input: _settingsInput,
//               cb: () => setState(
//                 () {
//                   _currentIndex = 3;
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class MyBottomAppBarItem extends StatelessWidget {
//   const MyBottomAppBarItem({
//     super.key,
//     required this.artboard,
//     required this.cb,
//     required this.currentIndex,
//     required this.tabIndex,
//     required this.input,
//   });
//   final Artboard? artboard;
//   final VoidCallback cb;
//   final int currentIndex;
//   final int tabIndex;
//   final SMIInput<bool>? input;

//   @override
//   Widget build(BuildContext context) {
//     if (input != null) {
//       input!.value = currentIndex == tabIndex;
//     }
//     return Flexible(
//       fit: FlexFit.tight,
//       child: GestureDetector(
//         onTap: cb,
//         child: artboard == null ? const SizedBox() : Rive(artboard: artboard!),
//       ),
//     );
//   }
// }
