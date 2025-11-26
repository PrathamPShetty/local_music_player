// import 'package:audio_service/audio_service.dart';
// import 'package:just_audio/just_audio.dart';
//
// class MyAudioHandler extends BaseAudioHandler {
//   final _player = AudioPlayer();
//
//   MyAudioHandler() {
//     // Listen to playback state changes and broadcast to the notification
//     _player.playerStateStream.listen((playerState) {
//       playbackState.add(playbackState.value.copyWith(
//         playing: _player.playing,
//         processingState: _mapProcessingState(_player.processingState),
//       ));
//     });
//   }
//
//   @override
//   Future<void> play() => _player.play();
//
//   @override
//   Future<void> pause() => _player.pause();
//
//   @override
//   Future<void> stop() async {
//     await _player.stop();
//     return super.stop();
//   }
//
//   @override
//   Future<void> seek(Duration position) => _player.seek(position);
//
//   // Map just_audio states to audio_service states
//   AudioProcessingState _mapProcessingState(ProcessingState state) {
//     switch (state) {
//       case ProcessingState.idle:
//         return AudioProcessingState.idle;
//       case ProcessingState.loading:
//         return AudioProcessingState.loading;
//       case ProcessingState.buffering:
//         return AudioProcessingState.buffering;
//       case ProcessingState.ready:
//         return AudioProcessingState.ready;
//       case ProcessingState.completed:
//         return AudioProcessingState.completed;
//       default:
//         return AudioProcessingState.idle;
//     }
//   }
// }
