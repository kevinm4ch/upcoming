class Movie {
    int id;
    String title;
    String overview;
    DateTime releaseDate;
    double voteAverage;
    String posterPath;
    String? backdropPath;
    List<int> genreIds;

    Movie({
        required this.id,
        required this.title,
        required this.overview,
        required this.releaseDate,
        required this.voteAverage,
        required this.posterPath,
        required this.backdropPath,
        required this.genreIds,
    });

    factory Movie.fromJson(Map<String, dynamic> json) => Movie(
        id: json["id"],
        title: json["title"],
        overview: json["overview"],
        releaseDate: DateTime.parse(json["release_date"]),
        voteAverage: json["vote_average"]?.toDouble(),
        posterPath: json["poster_path"],
        backdropPath: json["backdrop_path"],
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
    );
    
}
