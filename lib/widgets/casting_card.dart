import 'package:flutter/material.dart';

class CastingCard extends StatelessWidget {
  const CastingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, int index) {
          return const _CastCard();
        },
      ),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      height: 110,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
                placeholder: AssetImage('assets/image/loading.gif'),
                image: NetworkImage('https://loremflickr.com/150/300'),
                height: 140,
                width: 100,
                fit: BoxFit.cover),
          ),
          const SizedBox(height: 5),
          const Text('actor.name jahskjdahkja', maxLines: 2, overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,)
        ],
      ),
    );
  }
}
