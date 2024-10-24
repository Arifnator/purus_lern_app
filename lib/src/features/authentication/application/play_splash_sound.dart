import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:purus_lern_app/src/core/firebase/firebase_analytics/log_any.dart';

AudioPlayer audioPlayer = AudioPlayer();

Future<void> playSplashSound(AudioPlayer audioPlayer) async {
  try {
    await audioPlayer.setSource(AssetSource("sounds/splash_sound.wav"));
    await audioPlayer.resume();
    debugPrint("Sound played successfully!");
    logAny("splash_sound", "Sound played successfully!");
  } catch (e) {
    debugPrint("Error playing sound: $e");
    logAny("splash_sound", "Error playing sound: $e");
  }
}
