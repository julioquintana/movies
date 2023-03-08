import 'package:flutter/material.dart';
import 'package:movies/model/movies.dart';
import 'package:movies/widgets/widgets.dart' show MoviePoster;

class SliderMovie extends StatefulWidget {
  final List<Movie> movies;
  final String? title;
  final Function nextPage;

  const SliderMovie({Key? key, required this.movies, this.title = '', required this.nextPage}) : super(key: key);

  @override
  State<SliderMovie> createState() => _SliderMovieState();
}

class _SliderMovieState extends State<SliderMovie> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if ((_scrollController.position.pixels) >= _scrollController.position.maxScrollExtent-500) widget.nextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.title != '',
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(widget.title!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movies.length,
              itemBuilder: (_, int index) => MoviePoster(
                movie: widget.movies[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
