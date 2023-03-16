import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../utils/utils.dart';

class CirclePlayButton extends StatelessWidget {
  const CirclePlayButton({
    super.key,
    required this.isPlaying,
    required this.player,
  });

  final bool isPlaying;
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kCircleBoxDecoration,
      child: Center(
        child: IconButton(
          icon: isPlaying ? kPlayIcon : kPauseIcon,
          onPressed: () async {
            if (isPlaying) {
              await player.pause();
            } else {
              await player.resume();
            }
          },
        ),
      ),
    );
  }
}
