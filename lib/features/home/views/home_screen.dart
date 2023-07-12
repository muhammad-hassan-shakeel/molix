import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molix/config/environment.dart';
import 'package:molix/config/facade/network_facade.dart';
import 'package:molix/config/theme/dark_theme.dart';
import 'package:molix/config/theme/light_theme.dart';
import 'package:molix/features/home/bloc/movie_bloc.dart';
import 'package:molix/features/home/views/downloads_screen.dart';
import 'package:molix/features/home/views/movies_list.dart';
import 'package:molix/features/home/views/profile_screen.dart';
import 'package:molix/features/home/views/search_screen.dart';
import 'package:molix/features/theme/cubit/theme_cubit.dart';

import 'bottom_nav.dart';

@RoutePage()
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
      appBar: AppBar(
        title: Text('mOlIx',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary)),
        actions: [
          // Theme switch
          IconButton(
            onPressed: () {
              if (context.read<ThemeCubit>().state.themeData is LightTheme) {
                context.read<ThemeCubit>().changeTheme(const DarkTheme());
              } else {
                context.read<ThemeCubit>().changeTheme(const LightTheme());
              }
            },
            icon: Icon(
              Icons.brightness_4_outlined,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavbar(),
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

            if (state is MovieError) {
              return Center(
                  child: TextButton(
                      onPressed: () {
                        context.read<MovieBloc>().add(FetchMovieEvent(
                            apiKey: context.read<Environment>().apiKey));
                      },
                      child: const Text('Error.. Retry')));
            }

            if (state is MovieFetched) {
              final screens = [
                MoviesList(collection: state.collection),
                const SearchScreen(),
                const DownloadsScreen(),
                const ProfileScreen(),
              ];
              return screens[state.currentTab];
            } else {
              return const Center(child: Text('Error'));
            }
          },
        ),
      ),
    );
  }
}
