import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/helpers/debouncer.dart';
import 'package:movies/model/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _baseUrl = 'api.themoviedb.org';
  final String _apiKey = 'd4a57a264cbcc6d9187df7e913200b59';
  final String _language = 'es_ES';
  List<Movie> nowPlayingList = [];
  List<Movie> populares = [];
  int nowPlayingPage = 0;
  int popularPage = 0;

  Map<int, List<Cast>> _castList = {};

  final debouncer = Debouncer(duration: const Duration(milliseconds: 500));

  final StreamController<List<Movie>> _suggestionStreamController = StreamController.broadcast();

  Stream<List<Movie>> get suggestionStream => _suggestionStreamController.stream;

  MoviesProvider() {
    getNowPlaying();
    getPopulares();
  }

  getNowPlaying() async {
    nowPlayingPage++;
    nowPlayingList = [
      ...nowPlayingList,
      ...NowPlayingResponse.fromRawJson(await _getMovies('now_playing', nowPlayingPage)).results
    ];
    notifyListeners();
  }

  getPopulares() async {
    popularPage++;
    populares = [...populares, ...PopularResponse.fromRawJson(await _getMovies('popular', popularPage)).results];
    notifyListeners();
  }

  _getMovies(String type, int page) async {
    print({type, page});
    var url = Uri.https(_baseUrl, '/3/movie/$type', {'language': _language, 'api_key': _apiKey, 'page': '$page'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return response.body.toString();
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return <Movie>[];
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (_castList.containsKey(movieId)) return _castList[movieId]!.toList();

    var url = Uri.https(_baseUrl, '/3/movie/$movieId/credits', {'language': _language, 'api_key': _apiKey});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var castResponse = CreditsResponse.fromRawJson(response.body.toString()).cast;
      _castList[movieId] = castResponse;

      return castResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return <Cast>[];
  }

  Future<List<Movie>> searchMovies(String query) async {
    var url = Uri.https(_baseUrl, '/3/search/movie', {'language': _language, 'api_key': _apiKey, 'query': query});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return SearchResponse.fromRawJson(response.body.toString()).results;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return <Movie>[];
  }

  void getSuggestionsByQuery(String query) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchMovies(value);
      _suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(const Duration(milliseconds: 300), (_) {
      debouncer.value = query;
    });
    Future.delayed(const Duration(milliseconds: 301)).then((_) => timer.cancel());
  }
}
