import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:molix/features/home/bloc/movie_bloc.dart';
import 'package:molix/features/home/repository/enums/search_enum.dart';
import 'package:molix/features/home/repository/models/movie_model.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieFetched) {
          final movieState = state;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  onChanged: (value) {
                    context
                        .read<MovieBloc>()
                        .add(SearchMovieEvent(query: value));
                  },
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _showSearchScopeMenu(context),
                  ),
                ),
                const SizedBox(height: 16),
                Text('Searching scope: ${movieState.movieSearch.name}',
                    style: Theme.of(context).textTheme.bodyLarge),
                _buildSearchResult(movieState.searchResults),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }

  // search scope context menu method
  Widget _showSearchScopeMenu(BuildContext context) {
    return PopupMenuButton<MovieSearchCategory>(
      onSelected: (value) {
        context
            .read<MovieBloc>()
            .add(ChangeMovieSearchCategory(movieSearch: value));
      },
      itemBuilder: (context) {
        return MovieSearchCategory.values
            .map((e) => PopupMenuItem<MovieSearchCategory>(
                value: e, child: Text(e.name)))
            .toList();
      },
      child: Icon(
        Icons.arrow_drop_down,
        color: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _buildSearchResult(List<MovieModel> movies) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final movie = movies[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(movie.imageUrl),
            ),
            title: Text(movie.name),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 2),
        itemCount: movies.length,
      ),
    );
  }
}
