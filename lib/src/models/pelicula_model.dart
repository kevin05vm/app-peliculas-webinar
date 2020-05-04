import 'dart:convert';

Pelicula peliculaFromJson(String str) => Pelicula.fromJson(json.decode(str));

class Pelicula {
    String title;
    String posterPath;
    String backdropPath;
    double voteAverage;
    String overview;

    Pelicula({
        this.title,
        this.posterPath,
        this.backdropPath,
        this.voteAverage,
        this.overview,
    });

    factory Pelicula.fromJson(Map<String, dynamic> json) => Pelicula(
        title: json["title"],
        posterPath: "https://image.tmdb.org/t/p/w500/${json['poster_path']}",
        backdropPath: "https://image.tmdb.org/t/p/w500/${json['backdrop_path']}",
        voteAverage: json["vote_average"].toDouble(),
        overview: json["overview"],
    );

}
