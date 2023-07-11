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
