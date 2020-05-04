import 'dart:convert';

import 'package:app_peliculas/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apiKey = "a70b8eaa1dd3a3c34161871d0318b5d1";
  String _language = "es-Es";

  String _url = "api.themoviedb.org";
  String _getPeliculasPoint = "3/movie/now_playing";

  Future<List<Pelicula>> getPeliculas() async {
    final url = Uri.https(_url, _getPeliculasPoint, {
      'api_key' : _apiKey,
      'language' : _language
    });
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    print(decodedData['results']);
    return List<Pelicula>.from(decodedData["results"].map((x) => Pelicula.fromJson(x)));
  }

}