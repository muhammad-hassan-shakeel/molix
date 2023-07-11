import 'package:flutter/material.dart';
import 'package:molix/features/home/repository/models/collection_model.dart';

import 'banner.dart';
import 'horizontal_scrolling_view.dart';

class MoviesList extends StatelessWidget {
  const MoviesList({super.key, required this.collection});

  final MovieCollectionModel collection;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        BannerWidget(movies: collection.allMovies),
        const SizedBox(height: 24),
        HorizontalScrollerWidget(
            title: 'Popular', movies: collection.popularMovies),
        const SizedBox(height: 24),
        HorizontalScrollerWidget(
            title: 'Now Playing', movies: collection.nowPlayingMovies),
        const SizedBox(height: 24),
        HorizontalScrollerWidget(
          title: 'Top Rated',
          movies: collection.topRatedMovies,
        ),
        const SizedBox(height: 24),
        HorizontalScrollerWidget(
          title: 'Recommended',
          movies: collection.recommendedMovies,
        ),
      ],
    );
  }
}
