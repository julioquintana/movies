import 'dart:convert';
import 'models.dart';

class NowPlayingResponse {
  Dates dates;
  int page;
  List<Movies> results;
  int totalPages;
  int totalResults;

  NowPlayingResponse({
    required this.dates,
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingResponse.fromRawJson(String str) => NowPlayingResponse.fromJson(json.decode(str));

  factory NowPlayingResponse.fromJson(Map<String, dynamic> json) => NowPlayingResponse(
        dates: Dates.fromJson(json["dates"]),
        page: json["page"],
        results: List<Movies>.from(json["results"].map((x) => Movies.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  @override
  String toString() {
    return 'NowPlayingResponse{dates: $dates, page: $page, results: $results, totalPages: $totalPages, totalResults: $totalResults}';
  }
}

class Dates {
  Dates({
    required this.maximum,
    required this.minimum,
  });

  DateTime maximum;
  DateTime minimum;

  factory Dates.fromRawJson(String str) => Dates.fromJson(json.decode(str));

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );
}
