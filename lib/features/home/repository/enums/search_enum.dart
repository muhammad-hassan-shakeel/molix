import 'package:molix/features/home/repository/models/collection_model.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';

enum MovieSearchCategory {
  popular,
  topRated,
  recommended,
  nowPlaying,
  all,
}

extension MovieSearchX on MovieSearchCategory {
  String get name {
    switch (this) {
      case MovieSearchCategory.popular:
        return 'Popular';
      case MovieSearchCategory.topRated:
        return 'Top Rated';
      case MovieSearchCategory.recommended:
        return 'Recommended';
      case MovieSearchCategory.nowPlaying:
        return 'Now Playing';
      case MovieSearchCategory.all:
        return 'All';
      default:
        return '';
    }
  }

  List<MovieModel> searchResults(
      MovieCollectionModel collection, String query) {
    switch (this) {
      case MovieSearchCategory.popular:
        return collection.popularMovies
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      case MovieSearchCategory.topRated:
        return collection.topRatedMovies
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      case MovieSearchCategory.recommended:
        return collection.recommendedMovies
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      case MovieSearchCategory.nowPlaying:
        return collection.nowPlayingMovies
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      case MovieSearchCategory.all:
        return collection.allMovies
            .where((element) =>
                element.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      default:
        return [];
    }
  }
}
