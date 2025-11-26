import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;
  final double size;

  const PlayPauseButton({
    super.key,
    required this.isPlaying,
    required this.onPressed,
    this.size = 60,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: size,
      icon: Icon(
        isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
        color: Colors.deepPurple,
      ),
      onPressed: onPressed,
    );
  }
}
