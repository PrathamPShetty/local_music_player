import 'package:flutter/material.dart';

class SeekBar extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final ValueChanged<Duration> onSeek;

  const SeekBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.onSeek,
  });

  @override
  Widget build(BuildContext context) {
    double progress = 0;
    if (totalDuration.inMilliseconds > 0) {
      progress = currentPosition.inMilliseconds / totalDuration.inMilliseconds;
    }

    return Column(
      children: [
        Slider(
          value: progress.clamp(0.0, 1.0),
          onChanged: (value) {
            final position = totalDuration * value;
            onSeek(position);
          },
          activeColor: Colors.deepPurple,
          inactiveColor: Colors.deepPurple.shade100,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(_formatDuration(currentPosition)),
              Text(_formatDuration(totalDuration)),
            ],
          ),
        ),
      ],
    );
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}
