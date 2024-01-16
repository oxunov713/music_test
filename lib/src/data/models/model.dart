class Song {
  final String name;
  final String url;
  final String urlImage;
  final int id;
  final int specId;

  Song({
    required this.id,
    required this.specId,
    required this.name,
    required this.urlImage,
    required this.url,
  });
}

class Artist {
  final int id;
  final int specId;
  final String artistName;
  final String urlImage;

  Artist({
    required this.id,
    required this.specId,
    required this.artistName,
    required this.urlImage,
  });
}
