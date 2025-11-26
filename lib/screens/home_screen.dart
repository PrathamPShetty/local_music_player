import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../core/theme/app_themes.dart';
import '../cubits/home/songs_cubit.dart';
import '../cubits/home/song_state.dart';
import 'package:go_router/go_router.dart';
import '../cubits/theme/theme_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          "Local Music Player",
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 22),
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

      // ---------------- CENTERED FAB ----------------
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SongCubit>().pickSong(context);
        },
        backgroundColor: theme.floatingActionButtonTheme.backgroundColor,
        child: Icon(Icons.add, size: 32, color: theme.primaryColor.computeLuminance() > 0.5 ? Colors.black : Colors.white),
        elevation: 6,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      body: BlocBuilder<SongCubit, SongState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // ---------------- SEARCH BAR ----------------
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  onChanged: (value) {
                    context.read<SongCubit>().updateSearchQuery(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search songs...",
                    prefixIcon: Icon(Icons.search, color: theme.primaryColor),
                    filled: true,
                    fillColor: theme.primaryColor.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  style: theme.textTheme.bodyMedium,
                ),
              ),

              // ---------------- SONG LIST ----------------
              Expanded(
                child: state.filteredSongs.isEmpty
                    ? Center(
                  child: Text(
                    "No songs found",
                    style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  itemCount: state.filteredSongs.length,
                  itemBuilder: (_, index) {
                    final song = state.filteredSongs[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        leading: Icon(Icons.music_note, size: 32, color: theme.primaryColor),
                        title: Text(
                          song.title,
                          style: theme.textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          song.artist,
                          style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
                        ),
                        trailing: Icon(Icons.play_arrow, color: theme.primaryColor),
                        onTap: () {
                          context.read<SongCubit>().openSong(context, song);
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
