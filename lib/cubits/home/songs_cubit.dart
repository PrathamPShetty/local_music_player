import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';
import '../../database/db_helper.dart';
import '../../models/song_model.dart';
import 'song_state.dart';

class SongCubit extends Cubit<SongState> {
  SongCubit() : super(SongState.initial()) {
    loadSongs();
  }

  Future<void> loadSongs() async {
    emit(state.copyWith(loading: true));

    final list = await DBHelper.instance.getAllSongs();

    emit(state.copyWith(
      songs: list,
      filteredSongs: list,
      loading: false,
    ));
  }

  Future<void> pickSong(context) async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result == null) {
      emit(state.copyWith(error: "No file selected"));
      return;
    }

    final path = result.files.single.path!;
    final fileName = result.files.single.name;

    // Check duplicates
    final exists = state.songs.any((song) => song.title == fileName);

    if (exists) {
      // If song exists → update the path and play
      await DBHelper.instance.updateSongPath(fileName, path);

      // Reload DB
      await loadSongs();
      GoRouter.of(context).push('/player', extra: path);

      return;
    }

    // Insert new song
    await DBHelper.instance.insertSong(
      SongModel(title: fileName, artist: "Unknown Artist", filePath: path),
    );

    await loadSongs();

    GoRouter.of(context).push('/player', extra: path);

  }

  Future<void> openSong(context, SongModel song) async {
    final exists = await File(song.filePath).exists();

    if (!exists) {
      // Delete from DB
      await DBHelper.instance.deleteSong(song.id!);

      // Reload songs list
      await loadSongs();

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("File removed or moved")),
      );

      return;
    }

    GoRouter.of(context).push('/player', extra: song.filePath);

  }

  void updateSearchQuery(String query) {
    final filtered = state.songs.where((song) {
      return song.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    emit(state.copyWith(
      searchQuery: query,
      filteredSongs: filtered,
    ));
  }


}
