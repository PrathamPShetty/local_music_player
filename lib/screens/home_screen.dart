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
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: const Text(
          "Local Music Player",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.color_lens),
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
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add, size: 32),
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
                    prefixIcon: const Icon(Icons.search, color: Colors.deepPurple),
                    filled: true,
                    fillColor: Colors.deepPurple.withOpacity(0.05),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),

              // ---------------- SONG LIST ----------------
              Expanded(
                child: state.filteredSongs.isEmpty
                    ? const Center(
                  child: Text(
                    "No songs found",
                    style: TextStyle(fontSize: 18, color: Colors.grey),
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
                        leading: const Icon(Icons.music_note, size: 32, color: Colors.deepPurple),
                        title: Text(
                          song.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        subtitle: Text(
                          song.artist,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        trailing: const Icon(Icons.play_arrow, color: Colors.deepPurple),
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
