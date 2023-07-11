import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({
    super.key,
    required this.movies,
  });
  final List<MovieModel> movies;
  final imageBaseUrl = 'https://www.themoviedb.org/t/p/w1280';

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 250.0,
        enlargeCenterPage: true,
        autoPlay: true,
      ),
      items: movies.map((movie) {
        final imageUrl = '$imageBaseUrl${movie.imageUrl}';
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Text(
                  movie.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
              ),
            )
          ],
        );
      }).toList(),
    );
  }
}
