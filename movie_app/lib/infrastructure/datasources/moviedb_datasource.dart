//Implementacion de moviedb datasource

import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/domain/datasources/movies_datasources.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movie_app/infrastructure/models/moviedb_response.dart';
import 'package:movie_app/infrastructure/models/singular_moviedb.dart';

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
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;
    
  }

}