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
      // ---------------- GRADIENT BACKGROUND ----------------
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple.shade700, Colors.deepPurple.shade200],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: BlocBuilder<PlayerCubit, PlayerState>(
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // ---------------- ARTWORK ----------------
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: state.artwork != null
                          ? ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.memory(
                          state.artwork!,
                          fit: BoxFit.cover,
                        ),
                      )
                          : const Icon(Icons.music_note, size: 120, color: Colors.white70),
                    ),

                    const SizedBox(height: 24),

                    // ---------------- SONG TITLE & ARTIST ----------------
                    Text(
                      state.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.artist,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // ---------------- PLAY/PAUSE BUTTON ----------------
                    PlayPauseButton(
                      isPlaying: state.isPlaying,
                      onPressed: () => context.read<PlayerCubit>().togglePlay(),
                      size: 90,
                    ),

                    const SizedBox(height: 24),

                    // ---------------- SEEK BAR ----------------
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: SeekBar(
                        currentPosition: state.currentPosition,
                        totalDuration: state.totalDuration,
                        onSeek: (position) => context.read<PlayerCubit>().seek(position),
                        progressBarColor: Colors.white,
                        backgroundBarColor: Colors.white38,
                        handleColor: Colors.deepPurpleAccent,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
