import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class CardWiper extends StatelessWidget {
  const CardWiper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: double.infinity,
      height: size.height * .5,
      child: Swiper(
        itemCount: 10,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * .6,
        itemHeight: size.height * .4,
        itemBuilder: (_, int index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'Movie instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: const FadeInImage(
                placeholder: AssetImage('assets/image/loading.gif'),
                image: NetworkImage('https://loremflickr.com/300/400'),
                fit: BoxFit.cover,
              ),
            ),
          );
        },
      ),
    );
  }
}
