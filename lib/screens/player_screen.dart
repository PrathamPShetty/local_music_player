import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/player/player_cubit.dart';
import '../cubits/player/player_state.dart';
import 'package:local_music_player/widgets/play_pause_button.dart';
import 'package:local_music_player/widgets/seek_bar.dart';

class PlayerScreen extends StatefulWidget {
  final String filePath;
  const PlayerScreen({super.key, required this.filePath});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PlayerCubit>().loadSong(widget.filePath);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Now Playing")),
      body: Center(
        child: BlocBuilder<PlayerCubit, PlayerState>(
          builder: (context, state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                state.artwork != null
                    ? Image.memory(state.artwork!, width: 200, height: 200)
                    : const Icon(Icons.music_note, size: 200),
                const SizedBox(height: 16),
                Text(state.title, style: const TextStyle(fontSize: 20)),
                Text(state.artist, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 24),
                PlayPauseButton(
                  isPlaying: state.isPlaying,
                  onPressed: () => context.read<PlayerCubit>().togglePlay(),
                  size: 70,
                ),
                SeekBar(
                  currentPosition: state.currentPosition,
                  totalDuration: state.totalDuration,
                  onSeek: (position) => context.read<PlayerCubit>().seek(position),
                ),
              ],
            );

          },
        ),
      ),
    );
  }
}
