
import 'package:audio_service/audio_service.dart';
import 'package:just_audio/just_audio.dart';

class MyAudioHandler extends BaseAudioHandler with SeekHandler {
  final AudioPlayer _player = AudioPlayer();

  MyAudioHandler() {
    // Broadcast player state to clients
    _player.playerStateStream.listen((playerState) {
      playbackState.add(playbackState.value.copyWith(
        controls: [
          MediaControl.rewind,
          _player.playing ? MediaControl.pause : MediaControl.play,
          MediaControl.stop,
        ],
        playing: _player.playing,
        updatePosition: _player.position,
        processingState: AudioProcessingState.ready,
      ));
    });
  }

  Future<void> playFile(String path) async {
    await _player.setFilePath(path);
    await _player.play();
  }

  @override
  Future<void> play() => _player.play();

  @override
  Future<void> pause() => _player.pause();

  @override
  Future<void> stop() => _player.stop();

  @override
  Future<void> seek(Duration position) => _player.seek(position);
@override
  Future<void> dispose() async {
    await _player.dispose();
    // super.dispose();
  }
}
