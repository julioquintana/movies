import 'package:flutter/material.dart';
import 'package:movies/widgets/movie_poster.dart';

import '../model/models.dart';

class SearchResult extends StatelessWidget {
  final List<Movie> movies;

  const SearchResult({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 0,
          childAspectRatio: 0.8,
        ),
        itemCount: movies.length,
        itemBuilder: (BuildContext context, int index) {
          return MoviePoster(movie: movies[index]);
        },
      ),
    );
  }
}
