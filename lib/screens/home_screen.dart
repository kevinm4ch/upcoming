import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcoming/data/repository/movie_repository.dart';
import 'package:upcoming/widgets/movies_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Inicializa o provider num lugar seguro onde não ficar rebuildando
    Provider.of<MovieRepository>(context, listen: false).getMovies();
    
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.upcoming), Text('Upcoming', style: TextStyle(fontWeight: FontWeight.bold),)]
          ),
      ),
      body: MoviesGrid(),
    );
  }
}
