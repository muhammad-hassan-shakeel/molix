import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molix/config/environment.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/features/home/bloc/movie_bloc.dart';
import 'package:molix/features/home/views/banner.dart';
import 'package:molix/features/home/views/horizontal_scrolling_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MovieBloc(context.read<NetworkFacade>()),
        child: const _HomeView(),
      );
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(context).appBarTheme.backgroundColor?.withOpacity(0.3),
      appBar: AppBar(
        title: Text('mOlIx',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: BlocBuilder<MovieBloc, MovieState>(
          builder: (context, state) {
            if (state is MovieInitial) {
              context.read<MovieBloc>().add(
                  FetchMovieEvent(apiKey: context.read<Environment>().apiKey));
            }
            if (state is MovieLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is MovieFetched) {
              return ListView(
                children: [
                  BannerWidget(movies: state.collection.allMovies),
                  const SizedBox(height: 24),
                  HorizontalScrollerWidget(
                      title: 'Popular', movies: state.collection.popularMovies),
                  const SizedBox(height: 24),
                  HorizontalScrollerWidget(
                      title: 'Now Playing',
                      movies: state.collection.nowPlayingMovies),
                  const SizedBox(height: 24),
                  HorizontalScrollerWidget(
                    title: 'Top Rated',
                    movies: state.collection.topRatedMovies,
                  ),
                  const SizedBox(height: 24),
                  HorizontalScrollerWidget(
                    title: 'Recommended',
                    movies: state.collection.recommendedMovies,
                  ),
                ],
              );
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
