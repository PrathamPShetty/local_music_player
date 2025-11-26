import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPressed;
  final double size;

  const PlayPauseButton({
    super.key,
    required this.isPlaying,
    required this.onPressed,
    this.size = 70,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Use theme colors for gradient
    final gradientColors = isPlaying
        ? [theme.primaryColor, theme.colorScheme.secondary]
        : [theme.primaryColor.withOpacity(0.6), theme.colorScheme.secondary.withOpacity(0.6)];

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: theme.shadowColor.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          color: Colors.white,
          size: size * 0.6,
        ),
      ),
    );
  }
}
