import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/audio_handler/audio_handler.dart';
import 'core/router/app_router.dart';
import 'package:local_music_player/cubits/player/player_cubit.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final audioHandler = await AudioService.init(
    builder: () => MyAudioHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.local_music_player.channel',
      androidNotificationChannelName: 'Local Music Player',
      androidNotificationOngoing: true,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PlayerCubit()),
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
