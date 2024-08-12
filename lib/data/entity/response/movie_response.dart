import 'dart:convert';

import 'package:tmdb/domain/model/movie_list_model.dart';
import 'package:tmdb/util/extensions.dart';

class MovieListResponse {
  int? page;
  List<MovieListResultResponse>? results;

  MovieListResponse({
    this.page,
    this.results,
  });

  List<MovieListModel> toModel() {
    final List<MovieListModel> mappedResult = List.empty();
    results?.forEach((result) {
      mappedResult.add(result.toModel());
    });
    return mappedResult;
  }

  factory MovieListResponse.fromRawJson(String str) =>
      MovieListResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieListResponse.fromJson(Map<String, dynamic> json) =>
      MovieListResponse(
        page: json["page"],
        results: json["results"] == null
            ? []
            : List<MovieListResultResponse>.from(json["results"]!
                .map((x) => MovieListResultResponse.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class MovieListResultResponse {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  MovieListResultResponse({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  MovieListModel toModel() => MovieListModel(
      adult: adult.orFalse(),
      backdropPath: backdropPath.orEmpty(),
      genreIds: genreIds.orEmpty(),
      id: id.orZero(),
      originalLanguage: originalLanguage.orEmpty(),
      originalTitle: originalTitle.orEmpty(),
      overview: overview.orEmpty(),
      popularity: popularity.orZero(),
      posterPath: posterPath.orEmpty(),
      releaseDate: releaseDate.orEmpty(),
      title: title.orEmpty(),
      video: video.orFalse(),
      voteAverage: voteAverage.orZero(),
      voteCount: voteCount.orZero());

  factory MovieListResultResponse.fromRawJson(String str) =>
      MovieListResultResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MovieListResultResponse.fromJson(Map<String, dynamic> json) =>
      MovieListResultResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
