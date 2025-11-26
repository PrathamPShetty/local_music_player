import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:local_music_player/screens/home_screen.dart';
import 'package:local_music_player/screens/player_screen.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/player',
        builder: (context, state) {
          final filePath = state.extra as String; // Get path from extra
          return PlayerScreen(filePath: filePath);
        },
      ),
    ],
  );
}

