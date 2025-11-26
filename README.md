# 🎵 Local Music Player

A Flutter-based **offline music player** that scans local audio files, reads metadata, and provides smooth audio playback using Cubit state management and just_audio.

---

## 🚀 Getting Started

Follow the steps below to run the app locally.

### 1. Clone the repository

```bash
git clone https://github.com/PrathamPShetty/local_music_player.gitcd local_music_player
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

Run on the default connected device:

```bash
flutter run
```

Run on a specific device:

```bash
flutter run -d androidflutter run -d iosflutter run -d chromeflutter run -d macos
```

> **Note:** For iOS you must open the `ios/` project in Xcode and ensure proper signing & capabilities (e.g., background audio) are configured.

---

## 📁 Project Structure

```
local_music_player/├── lib/│   ├── core/│   │   ├── audio_handler/│   │   ├── router/│   │   │   └── app_router.dart│   │   └── theme/│   │       └── app_themes.dart│   ├── cubits/│   │   ├── home/│   │   │   ├── songs_cubit.dart│   │   │   └── song_state.dart│   │   ├── player/│   │   │   ├── player_cubit.dart│   │   │   └── player_state.dart│   │   └── theme/│   │       └── theme_cubit.dart│   ├── database/│   │   └── db_helper.dart│   ├── models/│   │   └── song_model.dart│   ├── screens/│   │   ├── home_screen.dart│   │   └── player_screen.dart│   ├── widgets/│   │   ├── play_pause_button.dart│   │   ├── play_pause_widget.dart│   │   └── seek_bar.dart│   └── main.dart├── images/├── android/├── ios/├── macos/├── windows/├── linux/├── web/└── pubspec.yaml
```

---

## 🛠️ Tech Stack

-   Flutter
-   Cubit (flutter_bloc)
-   just_audio
-   flutter_media_metadata
-   sqflite
-   Custom AppRouter
-   ThemeCubit

---

## 📱 Features

-   Scan and display local audio files
-   Read metadata (Title, Artist, Album Art)
-   Play / Pause / Seek
-   Background audio playback
-   Dynamic theme switching
-   Song search feature
-   Clean folder architecture using Cubits

---
## 🎨 Screenshots

### Theme 1
<img src="images/theme1.jpeg" width="300" />

### Theme 2
<img src="images/theme2.jpeg" width="300" />

### Theme 3
<img src="images/theme3.jpeg" width="300" />

---

## 🔍 Search Screen
<img src="images/search.png" width="300" />

___

## 🎥 Demo
<video src="images/vedio.mp4" width="350" autoplay loop muted></video>
---

## ⚙️ Permissions (Android)

Make sure these permissions are present in `android/app/src/main/AndroidManifest.xml` for Android 13+ media access and foreground behavior:

```xml
<uses-permission android:name="android.permission.READ_MEDIA_AUDIO" /><uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE" /><uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
```

For iOS, add the appropriate keys to `Info.plist` (e.g., `NSMicrophoneUsageDescription` if recording, and background audio in Capabilities).

---

## 👤 Author

**Pratham P Shetty**

GitHub: [https://github.com/PrathamPShetty](https://github.com/PrathamPShetty)

---

*Generated README for the Local Music Player project.*