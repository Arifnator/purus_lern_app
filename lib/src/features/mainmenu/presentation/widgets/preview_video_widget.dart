import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PreviewVideoWidget extends StatefulWidget {
  const PreviewVideoWidget({super.key});

  @override
  State<PreviewVideoWidget> createState() => _PreviewVideoWidgetState();
}

class _PreviewVideoWidgetState extends State<PreviewVideoWidget> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();

    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/previewtestvideo.mov')
          ..initialize().then((_) {
            setState(() {});
            _videoPlayerController.play();
          });
    _videoPlayerController.setLooping(true);
    _videoPlayerController.setVolume(0.0);
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _videoPlayerController.value.isInitialized
        ? AspectRatio(
            aspectRatio: _videoPlayerController.value.aspectRatio,
            child: VideoPlayer(_videoPlayerController),
          )
        : const Center(child: CircularProgressIndicator());
  }
}
