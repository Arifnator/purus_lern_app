import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveManager {
  static final RiveManager _instance = RiveManager._internal();
  factory RiveManager() => _instance;
  RiveManager._internal();

  Artboard? homeArtboard;
  SMIInput<bool>? homeInput;
  Artboard? eduArtboard;
  SMIInput<bool>? eduInput;
  Artboard? lexiArtboard;
  SMIInput<bool>? lexiInput;
  Artboard? settingsArtboard;
  SMIInput<bool>? settingsInput;

  Future<void> initialize() async {
    await RiveFile.initialize();
    await loadAnimations();
  }

  Future<void> loadAnimations() async {
    homeArtboard = await _loadRiveFile('assets/animations/home.riv');
    homeInput = _getInput(homeArtboard, 'State Machine 1', 'status');
    eduArtboard = await _loadRiveFile('assets/animations/edu.riv');
    eduInput = _getInput(eduArtboard, 'State Machine 1', 'status');
    lexiArtboard = await _loadRiveFile('assets/animations/lexicon.riv');
    lexiInput = _getInput(lexiArtboard, 'State Machine 1', 'status');
    settingsArtboard = await _loadRiveFile('assets/animations/settings.riv');
    settingsInput = _getInput(settingsArtboard, 'State Machine 1', 'status');
  }

  

  Future<Artboard> _loadRiveFile(String assetPath) async {
    final data = await rootBundle.load(assetPath);
    final file = RiveFile.import(data);
    return file.mainArtboard;
  }

  SMIInput<bool>? _getInput(
      Artboard? artboard, String stateMachineName, String inputName) {
    if (artboard == null) return null;
    final controller =
        StateMachineController.fromArtboard(artboard, stateMachineName);
    if (controller != null) {
      artboard.addController(controller);
      return controller.findInput<bool>(inputName);
    }
    return null;
  }
}
