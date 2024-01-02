import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerWldget extends StatefulWidget {
  const YoutubePlayerWldget({super.key, required this.youtubeKey});

  final String youtubeKey;

  @override
  State<YoutubePlayerWldget> createState() => _YoutubePlayerWldgetState();
}

class _YoutubePlayerWldgetState extends State<YoutubePlayerWldget> {
  late final YoutubePlayerController _controller;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.youtubeKey,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        enableCaption: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
      player: YoutubePlayer(controller: _controller),
      builder: (_, player) => player,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}