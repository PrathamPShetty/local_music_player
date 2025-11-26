import '../../models/song_model.dart';

class SongState {
  final List<SongModel> songs;
  final bool loading;
  final String? error;

  SongState({
    required this.songs,
    required this.loading,
    this.error,
  });

  factory SongState.initial() => SongState(
    songs: [],
    loading: false,
    error: null,
  );

  SongState copyWith({
    List<SongModel>? songs,
    bool? loading,
    String? error,
  }) {
    return SongState(
      songs: songs ?? this.songs,
      loading: loading ?? this.loading,
      error: error,
    );
  }
}
