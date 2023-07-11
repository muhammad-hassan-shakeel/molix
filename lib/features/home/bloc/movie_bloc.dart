import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/repository/enums/search_enum.dart';
import 'package:molix/features/home/repository/models/collection_model.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';
import 'package:molix/features/home/repository/movie_repository.dart';

part 'movie_event.dart';
part 'movie_state.dart';

/// Hydrated Bloc is a library that helps you to persist and restore bloc and cubit states.
class MovieBloc extends Bloc<MovieEvent, MovieState> with HydratedMixin {
  MovieBloc(NetworkFacade networkFacade)
      : _movieRepository = MovieRepsitoryV1(networkFacade),
        super(const MovieInitial()) {
    hydrate();
    on<FetchMovieEvent>(_onFetchMovieEvent);
    on<ChangeTabEvent>(_onChangeTabEvent);
    on<SearchMovieEvent>(_onSearchMovieEvent);
    on<ChangeMovieSearchCategory>(_onChangeMovieSearchCategory);
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

  void _onChangeTabEvent(ChangeTabEvent event, Emitter<MovieState> emit) {
    if (state is MovieFetched) {
      emit(MovieFetched(
        collection: (state as MovieFetched).collection,
        currentTab: event.currentTab,
        searchResults: MovieSearchCategory.all
            .searchResults((state as MovieFetched).collection, ''),
      ));
    }
  }

  void _onSearchMovieEvent(SearchMovieEvent event, Emitter<MovieState> emit) {
    if (state is MovieFetched) {
      emit(MovieFetched(
          collection: (state as MovieFetched).collection,
          currentTab: state.currentTab,
          movieSearch: (state as MovieFetched).movieSearch,
          searchResults: (state as MovieFetched)
              .movieSearch
              .searchResults((state as MovieFetched).collection, event.query)));
    }
  }

  void _onChangeMovieSearchCategory(
      ChangeMovieSearchCategory event, Emitter<MovieState> emit) {
    if (state is MovieFetched) {
      emit(MovieFetched(
        collection: (state as MovieFetched).collection,
        currentTab: state.currentTab,
        movieSearch: event.movieSearch,
        searchResults: event.movieSearch
            .searchResults((state as MovieFetched).collection, ''),
      ));
    }
  }

  //  Fetch movies from the Storage
  @override
  MovieState? fromJson(Map<String, dynamic> json) {
    try {
      return MovieFetched(
          collection: MovieCollectionModel.fromJson(json['collection']));
    } catch (e) {
      return null;
    }
  }

  // Save movies to the Storage
  @override
  Map<String, dynamic>? toJson(MovieState state) {
    if (state is MovieFetched) {
      return {'collection': state.collection.toJson()};
    }
    return null;
  }
}
