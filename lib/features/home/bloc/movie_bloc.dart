import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/repository/models/collection_model.dart';
import 'package:molix/features/home/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> with HydratedMixin {
  MovieBloc(NetworkFacade networkFacade)
      : _movieRepository = MovieRepsitoryV1(networkFacade),
        super(const MovieInitial()) {
    hydrate();
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

      final movieCollection =
          MovieCollectionModel.fromMovieEntity(movieEntityList);

      emit(MovieFetched(collection: movieCollection));
    } catch (e) {
      emit(MovieError(message: e.toString()));
    }
  }

  @override
  MovieState? fromJson(Map<String, dynamic> json) {
    try {
      return MovieFetched(
          collection: MovieCollectionModel.fromJson(json['collection']));
    } catch (e) {
      return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(MovieState state) {
    if (state is MovieFetched) {
      return {'collection': state.collection.toJson()};
    }
    return null;
  }
}
