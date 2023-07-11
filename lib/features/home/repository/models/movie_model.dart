import 'package:molix/features/home/repository/entity/movie_entity.dart';

class MovieModel {
  const MovieModel({required this.imageUrl, required this.name});

  factory MovieModel.fromMovieEntity(Movie movieEntity) => MovieModel(
      imageUrl: movieEntity.posterPath, name: movieEntity.originalTitle);

  final String imageUrl;
  final String name;
}
