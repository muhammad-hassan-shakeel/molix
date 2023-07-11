import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/repository/entity/movie_entity.dart';

abstract class MovieRepository {
  Future<MovieEntityList> getMovies(String apiKey);
}

class MovieRepsitoryV1 implements MovieRepository {
  const MovieRepsitoryV1(this._networkFacade);

  final NetworkFacade _networkFacade;

  @override
  Future<MovieEntityList> getMovies(String apiKey) async {
    final response = await _networkFacade
        .get('3/movie/popular', queryParameters: {"api_key": apiKey});

    if (response.isLeft) {
      final data = response.left;
      return MovieEntityList.fromJson(data);
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
