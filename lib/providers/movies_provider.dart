import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/model/models.dart';

class MoviesProvider extends ChangeNotifier {
  String _baseUrl = 'api.themoviedb.org';
  String _apiKey = 'd4a57a264cbcc6d9187df7e913200b59';
  String _language = 'es_ES';

  MoviesProvider() {
    print('Movies provider done');
    getOnNowMovies();
  }

  //List<String> arguments
  getOnNowMovies() async {
    // This example uses the Google Books API to search for books about http.
    // https://developers.google.com/books/docs/overview
    var url = Uri.https(_baseUrl, '/3/movie/now_playing', {'language': _language, 'api_key': _apiKey, 'page': '1'});

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      final nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);

      print(nowPlayingResponse.toString());
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}
