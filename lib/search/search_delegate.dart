import 'package:flutter/material.dart';
import 'package:movies/model/models.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  String? get searchFieldLabel => 'Buscar Película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [IconButton(icon: const Icon(Icons.clear), onPressed: () => query = '')];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => close(context, null));
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Text('buildResults');
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.isEmpty) return const SuggestionsEmpty();

    final movieProvider = Provider.of<MoviesProvider>(context, listen: false);
    return FutureBuilder<List<Movie>>(
        future: movieProvider.searchMovies(query),
        initialData: [],
        builder: (_, AsyncSnapshot<List<Movie>> snapshot) {
          if (!snapshot.hasData) const SuggestionsEmpty();
          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            padding: const EdgeInsets.all(8),
            itemBuilder: (_, int index) {
              return Container(
                height: 60,
                margin: const EdgeInsets.only(bottom: 9),
                child: _MovieItem(movies[index]),
              );
            },
          );
        });
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;

  const _MovieItem(this.movie);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
            width: 50,
            placeholder: const AssetImage('assets/image/no-image.jpg'),
            image: NetworkImage(movie.fullUrlPoster()),
            fit: BoxFit.contain),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
      onTap: () => Navigator.pushNamed(context, 'details', arguments: movie),
    );
  }
}
