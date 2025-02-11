import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:upcoming/data/models/movie_model.dart';
import 'package:upcoming/data/repository/movie_repository.dart';
import 'package:upcoming/screens/movie_detail_screen.dart';

class MoviesGrid extends StatefulWidget {
  const MoviesGrid({super.key});

  @override
  State<MoviesGrid> createState() => _MoviesGridState();
}

class _MoviesGridState extends State<MoviesGrid> {
  onSelectedMovie(Movie m) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MovieDetailScreen(movie: m),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieRepository>(
        builder: (ctx, repository, child) => repository.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  children: repository.movies
                      .map(
                        (m) => Stack(
                          children: [
                            Container(
                              color: const Color(0xFF3a4348),
                              child: Center(
                                child: Text(
                                  m.title,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),

                            FadeInImage(
                              placeholder: MemoryImage(kTransparentImage),
                              image: NetworkImage(
                                  "https://image.tmdb.org/t/p/w500/${m.posterPath}"),
                              fit: BoxFit.cover,
                            ),
                            
                            //Única maneira que encontrei de colocar o splash por cima da imagem e mantendo fadein
                            Positioned.fill(
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () => onSelectedMovie(m),
                                  
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ));
  }
}
