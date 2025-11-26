import 'dart:typed_data';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_media_metadata/flutter_media_metadata.dart';
import 'player_state.dart' as local_state;

class PlayerCubit extends Cubit<local_state.PlayerState> {
  final AudioPlayer _player = AudioPlayer();

  PlayerCubit() : super(local_state.PlayerState.initial());

  Future<void> loadSong(String path) async {
    final file = File(path);
    final meta = await MetadataRetriever.fromFile(file);

    emit(state.copyWith(
      title: meta.trackName ?? path.split("/").last,
      artist: meta.albumArtistName ?? "Unknown Artist",
      artwork: meta.albumArt,
    ));

    await _player.setFilePath(path);
    _player.play();

    _player.durationStream.listen((duration) {
      if (duration != null) emit(state.copyWith(totalDuration: duration));
    });

    _player.positionStream.listen((position) {
      emit(state.copyWith(currentPosition: position));
    });

    _player.playerStateStream.listen((playerState) {
      emit(state.copyWith(isPlaying: _player.playing));
    });
  }

  void togglePlay() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    emit(state.copyWith(isPlaying: _player.playing));
  }

  void seek(Duration position) {
    _player.seek(position);
  }

  @override
  Future<void> close() {
    _player.dispose();
    return super.close();
  }
}
