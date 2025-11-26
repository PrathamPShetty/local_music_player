import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/home/songs_cubit.dart';
import '../cubits/home/song_state.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Music Player")),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SongCubit>().pickSong(context);
        },
        child: const Icon(Icons.add),
      ),

      body: BlocBuilder<SongCubit, SongState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Column(
            children: [
              // 🔍 SEARCH BAR
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  onChanged: (value) {
                    context.read<SongCubit>().updateSearchQuery(value);
                  },
                  decoration: InputDecoration(
                    hintText: "Search songs...",
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),

              // 📃 SONG LIST
              Expanded(
                child: state.filteredSongs.isEmpty
                    ? const Center(child: Text("No songs found"))
                    : ListView.builder(
                  itemCount: state.filteredSongs.length,
                  itemBuilder: (_, index) {
                    final song = state.filteredSongs[index];
                    return ListTile(
                      leading: const Icon(Icons.music_note),
                      title: Text(song.title),
                      subtitle: Text(song.artist),
                      onTap: () {
                        context.read<SongCubit>().openSong(context, song);
                      },
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
