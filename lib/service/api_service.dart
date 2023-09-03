import 'dart:convert';
import 'dart:developer';

import 'package:flutter_task_movie/constants/my_constants.dart';

import '../modal/movie_modal.dart';
import 'package:http/http.dart' as http;

//service class
class ApiService {
  //method to call movies from API
  Future<List<Movie>> getMovies() async {
    final response = await http.get(Uri.parse(Constants.apiLink));

    if (response.statusCode == 200) {
      //converting jason data
      final decodeData = json.decode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      log('HTTP Error: ${response.statusCode}');
      log('Response Body: ${response.body}');
      throw Exception("Failed to load data");
    }
  }
}
