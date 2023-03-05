import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class Providers {
  static List<SingleChildWidget> provider(BuildContext context) {
    return [
      ChangeNotifierProvider<MoviesProvider>(create: (_) => MoviesProvider()),
    ];
  }
}
