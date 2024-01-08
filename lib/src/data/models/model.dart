class Song {
  final String name;
  final String url;
  final int id;

  Song({required this.id, required this.name, required this.url});
}

class MusicModel {
  final id;
  final String artistName;
  final String urlImage;
  final List<Song> songs;

  MusicModel(
      {required this.id,
      required this.artistName,
      required this.urlImage,
      required this.songs});
}
