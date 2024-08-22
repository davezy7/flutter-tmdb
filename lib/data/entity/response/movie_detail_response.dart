import 'dart:convert';

import 'package:tmdb/config/env.dart';
import 'package:tmdb/domain/model/movie_detail_model.dart';
import 'package:tmdb/util/extensions.dart';

class MovieDetailResponse {
  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  MovieDetailResponse({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory MovieDetailResponse.fromRawJson(String str) =>
      MovieDetailResponse.fromJson(json.decode(str));

  factory MovieDetailResponse.fromJson(Map<String, dynamic> json) =>
      MovieDetailResponse(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        revenue: json["revenue"],
        runtime: json["runtime"],
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  MovieDetailModel toModel() => MovieDetailModel(
      adult: adult.orFalse(),
      backdropPath: Env.imageUrl + backdropPath.orEmpty(),
      budget: budget.orZero(),
      genres: genres?.map((genre) => genre.name.orEmpty()).toList().orEmpty() ??
          List<String>.empty(),
      homepage: homepage.orEmpty(),
      id: id.orZero(),
      imdbId: imdbId.orEmpty(),
      originalLanguage: originalLanguage.orEmpty(),
      originalTitle: originalTitle.orEmpty(),
      overview: overview.orEmpty(),
      popularity: popularity.orZero(),
      posterPath: Env.imageUrl + posterPath.orEmpty(),
      releaseDate: releaseDate.orEmpty(),
      revenue: revenue.orZero(),
      runtime: runtime.orZero(),
      status: status.orEmpty(),
      tagline: tagline.orEmpty(),
      title: title.orEmpty(),
      video: video.orFalse(),
      voteAverage: voteAverage.orZero(),
      voteCount: voteCount.orZero());
}

class Genre {
  final int? id;
  final String? name;

  Genre({
    this.id,
    this.name,
  });

  factory Genre.fromRawJson(String str) => Genre.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
