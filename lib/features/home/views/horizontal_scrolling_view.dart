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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(title,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor)),
        ),
        const SizedBox(height: 4),
        SizedBox(
          height: 250,
          child: Row(
            children: [
              Expanded(
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    children: movies.map((movie) {
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: NetworkImage(movie.imageUrl),
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
