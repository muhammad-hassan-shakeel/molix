import 'package:molix/features/home/repository/entity/movie_entity.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';

class MovieCollectionModel {
  MovieCollectionModel({
    required this.popularMovies,
    required this.nowPlayingMovies,
    required this.topRatedMovies,
    required this.recommendedMovies,
  });

  factory MovieCollectionModel.fromMovieEntity(MovieEntityList movieEntities) {
    final popularMovies = movieEntities.results
        .sublist(0, 5)
        .map((e) => MovieModel.fromMovieEntity(e))
        .toList();

    final nowPlayingMovies = movieEntities.results
        .sublist(5, 10)
        .map((e) => MovieModel.fromMovieEntity(e))
        .toList();

    final topRatedMovies = movieEntities.results
        .sublist(10, 15)
        .map((e) => MovieModel.fromMovieEntity(e))
        .toList();

    final recommendedMovies = movieEntities.results
        .sublist(15, 20)
        .map((e) => MovieModel.fromMovieEntity(e))
        .toList();

    return MovieCollectionModel(
      popularMovies: popularMovies,
      nowPlayingMovies: nowPlayingMovies,
      topRatedMovies: topRatedMovies,
      recommendedMovies: recommendedMovies,
    );
  }

  factory MovieCollectionModel.fromJson(Map<String, dynamic> json) {
    final popularMovies = (json['popular_movies'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();

    final nowPlayingMovies = (json['now_playing_movies'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();

    final topRatedMovies = (json['top_rated_movies'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();

    final recommendedMovies = (json['recommended_movies'] as List)
        .map((e) => MovieModel.fromJson(e))
        .toList();

    return MovieCollectionModel(
      popularMovies: popularMovies,
      nowPlayingMovies: nowPlayingMovies,
      topRatedMovies: topRatedMovies,
      recommendedMovies: recommendedMovies,
    );
  }

  final List<MovieModel> popularMovies;
  final List<MovieModel> nowPlayingMovies;
  final List<MovieModel> topRatedMovies;
  final List<MovieModel> recommendedMovies;

  List<MovieModel> get allMovies =>
      popularMovies + nowPlayingMovies + topRatedMovies + recommendedMovies;

  Map<String, dynamic> toJson() => {
        'popular_movies': popularMovies.map((e) => e.toJson()).toList(),
        'now_playing_movies': nowPlayingMovies.map((e) => e.toJson()).toList(),
        'top_rated_movies': topRatedMovies.map((e) => e.toJson()).toList(),
        'recommended_movies': recommendedMovies.map((e) => e.toJson()).toList(),
      };
}
