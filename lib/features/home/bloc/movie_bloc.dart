import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/repository/entity/movie_entity.dart';
import 'package:molix/features/home/repository/movie_repository.dart';

import '../repository/models/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc(NetworkFacade networkFacade)
      : _movieRepository = MovieRepsitoryV1(networkFacade),
        super(const MovieInitial()) {
    on<FetchMovieEvent>(_onFetchMovieEvent);
  }

  final MovieRepository _movieRepository;

  Future<void> _onFetchMovieEvent(
    FetchMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    try {
      emit(const MovieLoading());
      final movieEntityList = await _movieRepository.getMovies(event.apiKey);
      final movies = movieEntityList.results
          .map((e) => MovieModel.fromMovieEntity(e))
          .toList();

      emit(MovieFetched(movies: movies));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }
}
