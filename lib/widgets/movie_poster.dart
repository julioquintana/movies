import 'package:flutter/material.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 20,
        itemBuilder: ( _, int index) {
          return Container(
            width: 130,
            height: 190,
            color: Colors.green,
            margin: const EdgeInsets.all(10),
          );
        },
      ),
    );
  }
}
