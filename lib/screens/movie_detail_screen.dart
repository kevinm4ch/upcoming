import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:upcoming/data/models/movie_model.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key, required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Text(movie.title),
                background: Stack(
                  children: [
                    Positioned.fill(
                      child: FadeInImage(
                        fit: BoxFit.cover,
                        placeholder: MemoryImage(kTransparentImage),
                        image: NetworkImage(
                            "https://image.tmdb.org/t/p/w500/${movie.backdropPath}"),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Colors.transparent,
                              Color(0xFF242e34)
                            ])),
                      ),
                    ),
                  ],
                )),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                SizedBox(
                  width: 200,
                  height: 300,
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: MemoryImage(kTransparentImage),
                    image: NetworkImage(
                        "https://image.tmdb.org/t/p/w500/${movie.posterPath}"),
                  ),
                ),
                Text(
                                    movie.overview,
                                    style: TextStyle(fontSize: 14.0, height: 1.5),
                                  ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  color: index.isOdd ? Colors.white : Colors.black12,
                  height: 100.0,
                  child: Center(
                    child:
                        Text('$index', textScaler: const TextScaler.linear(5)),
                  ),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
