import 'package:flutter/material.dart';
import 'package:movies/widgets/widgets.dart' show MoviePoster;

class SliderMovie extends StatelessWidget {
  const SliderMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('populares', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
        Expanded(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 20,
            itemBuilder: ( _, int index) {
              return const MoviePoster();
            },
          ),
        ),
        ],
      ),
    );
  }
}
