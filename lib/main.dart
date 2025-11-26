
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/app_router.dart';
import 'package:local_music_player/cubits/player/player_cubit.dart';

import 'cubits/home/songs_cubit.dart';



Future<void> main() async {

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayerCubit()),
        BlocProvider(create: (_) => SongCubit()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      title: "Local Music Player",
      debugShowCheckedModeBanner: false,

    );
  }
}
