import 'package:flutter/material.dart';
import 'package:movies/model/movies.dart';
import 'package:movies/widgets/widgets.dart' show MoviePoster;

class SliderMovie extends StatelessWidget {
  final List<Movie> movies;
  const SliderMovie({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: ( _, int index) => MoviePoster(movie: movies[index],),
          ),
        ),
        ],
      ),
    );
  }
}
