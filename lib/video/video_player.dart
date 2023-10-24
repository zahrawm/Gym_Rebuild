import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({
    super.key,
    required this.url,
  });

  final String url;

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;

  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.url))..initialize();

    _chewieController = ChewieController(
        videoPlayerController: _videoPlayerController,
        aspectRatio: 16 / 25,
        allowFullScreen: true,
        errorBuilder: (context, errorMessage) => Center(
              child: Text(errorMessage),
            ));
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 16 / 25,
          child: Chewie(controller: _chewieController),
        ),
        SizedBox(
          height: 20,
        ),
        Expanded(
            child: Row(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () async {
                  await _chewieController.play();
                },
                child: Text('Play')),
            TextButton(
                onPressed: () async {
                  await _chewieController.pause();
                },
                child: Text('Pause'))
          ],
        ))
      ],
    );
  }
}
