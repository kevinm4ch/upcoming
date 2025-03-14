import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:upcoming/data/repository/movie_repository.dart';
import 'package:upcoming/screens/home_screen.dart';

main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MovieRepository(), )
      ],
      child: MaterialApp(
        title: 'Upcoming',
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          appBarTheme: AppBarTheme(
              backgroundColor: Color(0xFF0d253f),
              titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              iconTheme: IconThemeData(size: 30)
          ),
          scaffoldBackgroundColor: Color(0xFF242e34),
          useMaterial3: true,
        ),
        home: HomeScreen(),
        
      ),
    );
  }
}
