import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class PlayerState extends Equatable {
  final String title;
  final String artist;
  final Uint8List? artwork;
  final bool isPlaying;
  final Duration currentPosition;
  final Duration totalDuration;

  const PlayerState({
    required this.title,
    required this.artist,
    this.artwork,
    this.isPlaying = false,
    this.currentPosition = Duration.zero,
    this.totalDuration = Duration.zero,
  });

  factory PlayerState.initial() => const PlayerState(
    title: "No Song",
    artist: "Unknown",
  );

  PlayerState copyWith({
    String? title,
    String? artist,
    Uint8List? artwork,
    bool? isPlaying,
    Duration? currentPosition,
    Duration? totalDuration,
  }) {
    return PlayerState(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      artwork: artwork ?? this.artwork,
      isPlaying: isPlaying ?? this.isPlaying,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
    );
  }

  @override
  List<Object?> get props => [title, artist, artwork, isPlaying, currentPosition, totalDuration];
}
