class SongModel {
  final int? id;
  final String title;
  final String artist;
  final String filePath;

  SongModel({
    this.id,
    required this.title,
    required this.artist,
    required this.filePath,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'artist': artist,
      'filePath': filePath,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      id: map['id'],
      title: map['title'],
      artist: map['artist'],
      filePath: map['filePath'],
    );
  }
}
