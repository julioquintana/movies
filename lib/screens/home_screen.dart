import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cine'),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))],
      ),
      body: Column(
        children: const [
          CardWiper()

        ],
      )
    );
  }
}
