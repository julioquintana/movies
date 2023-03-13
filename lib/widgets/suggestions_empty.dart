import 'package:flutter/material.dart';

class SuggestionsEmpty extends StatelessWidget {
  const SuggestionsEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130,
      ),
    );
  }
}
