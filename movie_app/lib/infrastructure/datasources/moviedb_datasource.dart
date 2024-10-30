//Implementacion de moviedb datasource

import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/domain/datasources/movies_datasources.dart';
import 'package:movie_app/domain/entities/movie.dart';

class MovieDatasource extends MoviesDatasource {

  //Peticion HTTP del API
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.movieDBkey,
      'language': 'en-CO'
    } ));

  @override
  Future <List<Movie>> getNowPlaying ({ int page = 1}) async {
    
    //donde se sacan las peliculas recientes
    final response = await dio.get('/movie/now_playing');

    final List<Movie> movies = [];
    return [];
  }

}