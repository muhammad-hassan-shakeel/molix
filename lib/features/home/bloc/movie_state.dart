part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieInitial extends MovieState {
  const MovieInitial();
}

class MovieFetched extends MovieState {
  final MovieCollectionModel collection;

  const MovieFetched({required this.collection});

  @override
  List<Object> get props => [collection];
}

class MovieLoading extends MovieState {
  const MovieLoading();
}

class MovieError extends MovieState {
  final String message;

  const MovieError({this.message = 'Something went wrong'});
}
