//la idea de un provider es que sea el proveedor de información


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/models.dart';

class MoviesProvider extends ChangeNotifier{

  final String _apiKey   = '7947e7063ac3930fe390d544d152b2be';
  final String _baseUrl  = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];

  MoviesProvider(){
    print('Movies Provider Inicializado');

    getOnDisplayMovies();
  }

  getOnDisplayMovies() async {
    var url = Uri.https( _baseUrl, '3/movie/now_playing', {
      'api_key': _apiKey,
      'language':_language,
      'page': '1'
    });
      

  // Await the http get response, then decode the json-formatted response.
    final response = await http.get(url);
    //esta linea convierte la petición http en un mapa y yo con eso puedo tomar lo que necesite de ese objeto.
    final nowPlayingResponse = NowPlayingResponse.fromJson( response.body );
    
    onDisplayMovies = nowPlayingResponse.results;

    notifyListeners(); 

  }

}