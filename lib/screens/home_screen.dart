import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Local Music Player")),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            final result = await FilePicker.platform.pickFiles(
              type: FileType.custom,
              allowedExtensions: ['mp3'],
            );

            if (result == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("No file selected")),
              );
              return;
            }

            context.push('/player', extra: result.files.single.path!);
          },
          child: const Text("Pick MP3"),
        ),
      ),
    );
  }
}
