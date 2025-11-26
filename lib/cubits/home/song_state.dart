import '../../models/song_model.dart';

class SongState {
  final List<SongModel> songs;        // full list from DB
  final List<SongModel> filteredSongs; // filtered list based on search
  final bool loading;
  final String? error;
  final String searchQuery;           // current search input

  SongState({
    required this.songs,
    required this.filteredSongs,
    required this.loading,
    this.error,
    this.searchQuery = '',
  });

  factory SongState.initial() => SongState(
    songs: [],
    filteredSongs: [],
    loading: false,
    error: null,
    searchQuery: '',
  );

  SongState copyWith({
    List<SongModel>? songs,
    List<SongModel>? filteredSongs,
    bool? loading,
    String? error,
    String? searchQuery,
  }) {
    return SongState(
      songs: songs ?? this.songs,
      filteredSongs: filteredSongs ?? this.filteredSongs,
      loading: loading ?? this.loading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}
