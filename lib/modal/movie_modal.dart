//class for movie details
class Movie {
  int? id;
  String? title;
  String? backDropPath;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;

  //constructor
  Movie({
    this.id,
    this.title,
    this.backDropPath,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
  });

  //converting JSON format to human readable format
  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      title: json["title"],
      backDropPath: json["backdrop_path"],
      originalTitle: json["original_title"],
      overview: json["overview"],
      posterPath: json["poster_path"],
      releaseDate: json["release_date"],
    );
  }
}
