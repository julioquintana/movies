import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:movies/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isLoading = false;
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children:  [
            CardWiper(movies: moviesProvider.nowPlayingList),
            SliderMovie(title: 'Populares',movies: moviesProvider.populares, nextPage: (){
              if (isLoading) return;
              isLoading = true;
              print('cargando');
              moviesProvider.getPopulares();
              isLoading = false;
            },),
          ],
        ),
      )
    );
  }
}
