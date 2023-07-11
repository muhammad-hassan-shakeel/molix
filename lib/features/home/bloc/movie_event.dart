part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class FetchMovieEvent extends MovieEvent {
  const FetchMovieEvent({required this.apiKey});

  final String apiKey;
}

class ChangeTabEvent extends MovieEvent {
  final int currentTab;

  const ChangeTabEvent({required this.currentTab});
}

class SearchMovieEvent extends MovieEvent {
  final String query;

  const SearchMovieEvent({required this.query});
}

class ChangeMovieSearchCategory extends MovieEvent {
  final MovieSearchCategory movieSearch;

  const ChangeMovieSearchCategory({required this.movieSearch});
}
