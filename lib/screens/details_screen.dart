import 'package:flutter/material.dart';
import 'package:movies/themes/app_theme.dart';
import 'package:movies/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            const _Overview(),
            const CastingCard(),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  const _CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: AppTheme.primary,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 5) ,
          child: const Text('movie.title', style: TextStyle(fontSize: 16)),
        ),
        background: const FadeInImage(
            placeholder: AssetImage('assets/image/loading.gif'),
            image: NetworkImage('https://loremflickr.com/300/400'),
            fit: BoxFit.cover),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/image/loading.gif'),
              image: NetworkImage('https://loremflickr.com/200/300'),
              fit: BoxFit.cover,
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('movie.title', style: textTheme.headlineSmall, overflow: TextOverflow.ellipsis),
              Text('movie.originalTitle', style: textTheme.titleSmall, overflow: TextOverflow.ellipsis),
              Row(
                children: [
                  const Icon(Icons.star_outline, size: 15, color: Colors.grey),
                  const SizedBox(width: 5),
                  Text('movie.voteAverage', style: textTheme.bodySmall)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  const _Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        'dicit class inciderint quot vestibulum detraxit velit laoreet solum consetetur sapien persequeris mei libris dictas ei adversarium percipit ornare deterruisset ultricies risus interpretaris corrumpit auctor veniam ut delenit dictum tamquam tamquam ridiculus diam no epicurei tibique doming morbi maecenas vocent cras aptent decore est eros pericula ius intellegat invenire facilis cubilia sagittis  cloudy dosis.',
        textAlign: TextAlign.justify,
        style: textTheme.titleMedium,
      ),
    );
  }
}
