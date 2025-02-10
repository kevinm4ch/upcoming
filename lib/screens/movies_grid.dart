import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:upcoming/data/repository/movie_repository.dart';

class MoviesGrid extends StatefulWidget {
  const MoviesGrid({super.key});

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<MovieRepository>(context, listen: false).getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRepository>(
        builder: (ctx, repository, child) => repository.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                children: repository.movies
                    .map((m) => Image.network(
                          "https://image.tmdb.org/t/p/w500/${m.posterPath}",
                          fit: BoxFit.cover,
                        ))
                    .toList(),
              ));
  }
}
