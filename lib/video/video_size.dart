import 'package:flutter/material.dart';
import 'package:gym_guide_app/video/video_player.dart';
import 'package:video_player/video_player.dart';

class VideoPlayersScreen extends StatelessWidget {
  const VideoPlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Players')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: const [
          // Local Assets
          VideoPlayerView(
            url: "assets/gym.mov",
            dataSourceType: DataSourceType.asset,
          ),
          SizedBox(height: 24),
          // Network
        ],
      ),
    );
  }
}
