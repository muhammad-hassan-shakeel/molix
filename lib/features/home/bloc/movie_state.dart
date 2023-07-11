part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState({this.currentTab = 0});

  final int currentTab;

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MovieFetched extends MovieState {
  final MovieCollectionModel collection;
  final List<MovieModel> searchResults;
  final MovieSearchCategory movieSearch;

  const MovieFetched(
      {required this.collection,
      super.currentTab,
      this.movieSearch = MovieSearchCategory.all,
      this.searchResults = const []});

  @override
  List<Object> get props =>
      [collection, currentTab, searchResults, movieSearch];
}

class MovieLoading extends MovieState {
  const MovieLoading({super.currentTab});

  @override
  List<Object> get props => [currentTab];
}

class MovieError extends MovieState {
  final String message;

  const MovieError({this.message = 'Something went wrong', super.currentTab});

  @override
  List<Object> get props => [message, currentTab];
}
