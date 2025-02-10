import 'package:flutter/material.dart';
import 'package:upcoming/screens/movies_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          spacing: 5,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Icon(Icons.upcoming), Text('Upcoming', style: TextStyle(fontWeight: FontWeight.bold),)]
          ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        foregroundColor: Theme.of(context).appBarTheme.foregroundColor,
      ),
      body: MoviesGrid(),
    );
  }
}
