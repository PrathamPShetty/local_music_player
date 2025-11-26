import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/player/player_cubit.dart';
import '../cubits/player/player_state.dart';
import 'package:local_music_player/widgets/play_pause_button.dart';
import 'package:local_music_player/widgets/seek_bar.dart';
import '../cubits/theme/theme_cubit.dart';
import '../core/theme/app_themes.dart';

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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [theme.primaryColor, theme.primaryColor.withOpacity(0.7)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          "Now Playing",
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Icon(Icons.color_lens, color: theme.appBarTheme.foregroundColor),
            onSelected: (value) {
              context.read<ThemeCubit>().setTheme(value);
            },
            itemBuilder: (context) => AppThemes.themes.keys.map((key) {
              return PopupMenuItem(
                value: key,
                child: Text(
                  key.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              );
            }).toList(),
          ),
        ],
        elevation: 6,
        shadowColor: Colors.black38,
      ),

      // ---------------- GRADIENT BACKGROUND ----------------
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              theme.primaryColor.withOpacity(0.8),
              theme.primaryColor.withOpacity(0.4)
            ],
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
                        color: theme.cardColor.withOpacity(0.2),
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
                          : Icon(
                        Icons.music_note,
                        size: 120,
                        color: theme.textTheme.bodyLarge?.color?.withOpacity(0.6),
                      ),
                    ),

                    const SizedBox(height: 24),

                    // ---------------- SONG TITLE & ARTIST ----------------
                    Text(
                      state.title,
                      style: theme.textTheme.titleLarge?.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.titleLarge?.color ?? Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      state.artist,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontSize: 16,
                        color: theme.textTheme.bodyMedium?.color?.withOpacity(0.8) ?? Colors.white70,
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
                        progressBarColor: theme.colorScheme.secondary,
                        backgroundBarColor: theme.colorScheme.secondary.withOpacity(0.4),
                        handleColor: theme.colorScheme.secondary,
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
