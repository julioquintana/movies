import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/model/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'd4a57a264cbcc6d9187df7e913200b59';
  final String _language = 'es_ES';
  List<Movie> nowPlayingList = [];
  List<Movie> populares = [];

  MoviesProvider() {
    print('Movies provider done');
    getNowPlaying();
    getPopulares();
  }

  getNowPlaying() async {
    nowPlayingList = NowPlayingResponse.fromRawJson(await _getMovies('now_playing')).results;
    notifyListeners();
  }

  getPopulares() async {
    populares = PopularResponse.fromRawJson(await _getMovies('popular')).results;
    notifyListeners();
  }

  _getMovies(String type) async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.https(_baseUrl, '/3/movie/$type', {'language': _language, 'api_key': _apiKey, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return <Movie>[];
  }
}
