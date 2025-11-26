import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'package:local_music_player/cubits/player/player_cubit.dart';
import 'cubits/home/songs_cubit.dart';
import 'cubits/theme/theme_cubit.dart'; // <- import ThemeCubit

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayerCubit()),
        BlocProvider(create: (_) => SongCubit()),
        BlocProvider(create: (_) => ThemeCubit()), // <- add ThemeCubit
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp.router(
          routerConfig: AppRouter.router,
          theme: state.themeData, // <- dynamically from ThemeCubit
          title: "Local Music Player",
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
