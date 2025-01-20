
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:webtoonhw/models/movie_detail.dart';
import 'package:webtoonhw/models/movie_popular.dart';

class ApiService {
  static const String baseUrl = "https://movies-api.nomadcoders.workers.dev";
  static const String movieDetailUrl = "https://movies-api.nomadcoders.workers.dev/movie?id=";
  static const String popular = "popular";
  static const String nowPlaying ="now-playing";
  static const String comSoon ="coming-soon";

  static Future<List<MoviePopular>> getPopularMovies() async {
    List<MoviePopular> popMoviesInstance = [];
    final url = Uri.parse("$baseUrl/$popular");
    final response = await http.get(url);

    if(response.statusCode == 200)
    {
        List<dynamic> popMovies = jsonDecode(response.body)['results'];

        for(var popMovie in popMovies){
          popMoviesInstance.add(MoviePopular.fromJson(popMovie));
        }  
        return popMoviesInstance;
    }
    throw Error();
  }

    static Future<List<MoviePopular>> getNowPlayingMovies() async {
    List<MoviePopular> nowPlayingMoviesInstance = [];
    final url = Uri.parse("$baseUrl/$nowPlaying");
    final response = await http.get(url);

    if(response.statusCode == 200)
    {
        List<dynamic> nowPlayingMovies = jsonDecode(response.body)['results'];

        for(var nowMovie in nowPlayingMovies){
          nowPlayingMoviesInstance.add(MoviePopular.fromJson(nowMovie));
        }  
        return nowPlayingMoviesInstance;
    }
    throw Error();
  }

    static Future<List<MoviePopular>> getCommingSoonMovies() async {
    List<MoviePopular> nowCommingSoonInstance = [];
    final url = Uri.parse("$baseUrl/$comSoon");
    final response = await http.get(url);

    if(response.statusCode == 200)
    {
        List<dynamic> nowCommingSoonMovies = jsonDecode(response.body)['results'];

        for(var commingMovie in nowCommingSoonMovies){
          nowCommingSoonInstance.add(MoviePopular.fromJson(commingMovie));
        }  
        return nowCommingSoonInstance;
    }
    throw Error();
  }

      static Future<MovieDetailModel> getMovieDetailById(int id) async{
      
      final url = Uri.parse('$movieDetailUrl$id');
     // print(url);
      final response = await http.get(url);

      if(response.statusCode == 200)
      {
        final movie = jsonDecode(response.body);
        return MovieDetailModel.fromJson(movie);
      }
      throw Error();
    }

}