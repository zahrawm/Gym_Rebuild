import 'package:flutter/material.dart';
import 'package:gym_guide_app/video/video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayersScreen extends StatelessWidget {
  static String routeName = "/videoPlayer";
  const VideoPlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Players')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: VideoPlayerView(
          url:
              "https://drive.google.com/uc?export=download&id=1vslKVvpJ4IWmULw_DY4Om6jY6NKL6Az6",
        
        ),
      ),
    );
  }
}
