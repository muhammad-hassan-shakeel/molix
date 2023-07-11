import 'package:flutter/material.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';

class HorizontalScrollerWidget extends StatelessWidget {
  const HorizontalScrollerWidget({
    super.key,
    required this.title,
    this.movies = const [],
  });

  final String title;
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).disabledColor)),
        const SizedBox(height: 4),
        SizedBox(
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: movies.map((movie) {
                      final imageUrl =
                          'https://www.themoviedb.org/t/p/w1280${movie.imageUrl}';
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList()),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
