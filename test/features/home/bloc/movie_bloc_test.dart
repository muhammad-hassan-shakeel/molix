import 'dart:convert';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/bloc/movie_bloc.dart';

import '../../mocks/home_mocks.dart';
import '../../mocks/mock_hydrated_storage.dart';

void main() {
  initHydratedStorage();
  final NetworkFacade networkFacade = NetworkFacadeMock();
  blocTest<MovieBloc, MovieState>(
    'emits [MyState] when FetchMovieEvent is added.',
    build: () {
      when(() => networkFacade.get(any(),
          queryParameters: any(named: 'queryParameters'))).thenAnswer(
        (_) async => Either.left(jsonDecode(movieResponse)),
      );
      return MovieBloc(networkFacade);
    },
    act: (bloc) => bloc.add(const FetchMovieEvent(apiKey: '124')),
    expect: () => [isA<MovieLoading>(), isA<MovieFetched>()],
  );
}
