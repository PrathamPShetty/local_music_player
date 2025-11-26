import 'package:flutter/material.dart';

class SeekBar extends StatelessWidget {
  final Duration currentPosition;
  final Duration totalDuration;
  final ValueChanged<Duration> onSeek;
  final Color? progressBarColor;
  final Color? backgroundBarColor;
  final Color? handleColor;

  const SeekBar({
    super.key,
    required this.currentPosition,
    required this.totalDuration,
    required this.onSeek,
    this.progressBarColor,
    this.backgroundBarColor,
    this.handleColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    double progress = 0;
    if (totalDuration.inMilliseconds > 0) {
      progress = currentPosition.inMilliseconds / totalDuration.inMilliseconds;
    }

    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: progressBarColor ?? theme.primaryColor,
            inactiveTrackColor: (backgroundBarColor ?? theme.primaryColor.withOpacity(0.3)).withOpacity(0.4),
            trackHeight: 6,
            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            thumbColor: handleColor ?? theme.colorScheme.secondary,
            overlayColor: (handleColor ?? theme.colorScheme.secondary).withOpacity(0.2),
            overlayShape: const RoundSliderOverlayShape(overlayRadius: 18),
          ),
          child: Slider(
            value: progress.clamp(0.0, 1.0),
            onChanged: (value) {
              final position = totalDuration * value;
              onSeek(position);
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDuration(currentPosition),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
              Text(
                _formatDuration(totalDuration),
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
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
