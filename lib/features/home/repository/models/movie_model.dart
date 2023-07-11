import 'package:molix/features/home/repository/entity/movie_entity.dart';

class MovieModel {
  const MovieModel({required this.imageUrl, required this.name});

  factory MovieModel.fromMovieEntity(Movie movieEntity) => MovieModel(
      imageUrl: movieEntity.posterPath, name: movieEntity.originalTitle);

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        imageUrl: json['poster_path'],
        name: json['original_title'],
      );

  final String imageUrl;
  final String name;

  Map<String, String> toJson() => {
        'poster_path': imageUrl,
        'original_title': name,
      };
}
