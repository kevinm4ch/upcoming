import 'package:flutter/material.dart';
import 'package:upcoming/data/models/movie_model.dart';
import 'package:upcoming/data/repository/api.dart';
import 'package:dio/dio.dart';

class MovieRepository extends ChangeNotifier {
  final Dio _dio = Dio();
  final String _apiKey = Api.token;

  final List<Movie> _movies = [];
  int _page = 1;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<Movie> get movies => _movies.sublist(0, (_movies.length - (_movies.length % 3)));


  String get _baseUrl =>
      "${Api.baseUrl}/movie/upcoming?language=pt-br&region=br&page=$_page";

  Map<String, String> get _headers => {'Authorization': "Bearer $_apiKey"};

  MovieRepository();

  getMovies() async {
    _isLoading = true;
    notifyListeners();

    final Response<dynamic> response;
    try {
      response = await _dio.request(_baseUrl,
          options: Options(method: 'GET', headers: _headers));
    } catch (e) {
      throw Exception(e);
    }

    if (response.statusCode == 200) {
      final results = response.data['results'] as List<dynamic>;

      results.removeWhere(
        (m) => m['title'] == null || 
          m['poster_path'] == null || 
          m['backdrop_path'] == null);

      _movies.addAll(List.from(results.map((m) => Movie.fromJson(m))));
      _page++;
    }
    _isLoading = false;
    notifyListeners();
  }
}
