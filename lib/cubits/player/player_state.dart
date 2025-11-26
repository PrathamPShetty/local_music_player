import 'dart:typed_data';
import 'package:equatable/equatable.dart';

class PlayerState {
  final String title;
  final String artist;
  final Uint8List? artwork;
  final Duration currentPosition;
  final Duration totalDuration;
  final bool isPlaying;
  final List<String> playlist; // file paths
  final int currentIndex;

  PlayerState({
    required this.title,
    required this.artist,
    this.artwork,
    this.currentPosition = Duration.zero,
    this.totalDuration = Duration.zero,
    this.isPlaying = false,
    this.playlist = const [],
    this.currentIndex = 0,
  });

  factory PlayerState.initial() => PlayerState(
    title: "",
    artist: "",
    artwork: null,
    currentPosition: Duration.zero,
    totalDuration: Duration.zero,
    isPlaying: false,
    playlist: [],
    currentIndex: 0,
  );

  PlayerState copyWith({
    String? title,
    String? artist,
    Uint8List? artwork,
    Duration? currentPosition,
    Duration? totalDuration,
    bool? isPlaying,
    List<String>? playlist,
    int? currentIndex,
  }) {
    return PlayerState(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      artwork: artwork ?? this.artwork,
      currentPosition: currentPosition ?? this.currentPosition,
      totalDuration: totalDuration ?? this.totalDuration,
      isPlaying: isPlaying ?? this.isPlaying,
      playlist: playlist ?? this.playlist,
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
