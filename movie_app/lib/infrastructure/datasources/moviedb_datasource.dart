//Implementacion de moviedb datasource

import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/domain/datasources/movies_datasources.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/mappers/movie_mapper.dart';
import 'package:movie_app/infrastructure/models/movie_details.dart';
import 'package:movie_app/infrastructure/models/moviedb_response.dart';
import 'package:movie_app/infrastructure/models/singular_moviedb.dart';

class MovieDatasource extends MoviesDatasource {

  //Peticion HTTP del API
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.movieDBkey,
      'language': 'es-MX'
    }
  ));

  List<Movie> _jsonToMovies( Map<String,dynamic> json ) {

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;

  }


  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    final response = await dio.get('/movie/now_playing', 
      queryParameters: {
        'page': page
      }
    );
    
    return _jsonToMovies(response.data);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
     
    final response = await dio.get('/movie/popular', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);    
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
     
    final response = await dio.get('/movie/top_rated', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);    
  }

   @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
     
    final response = await dio.get('/movie/upcoming', 
      queryParameters: {
        'page': page
      }
    );

    return _jsonToMovies(response.data);    
  }

  Future<Movie> getMovieById( String id ) async {
    final response = await dio.get('/movie/$id');
    if ( response.statusCode != 200 ) throw Exception('Movie with id: $id not found');
    
    final movieDetails = MovieDetails.fromJson( response.data );
    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    return movie;
  }

   @override
  Future<List<Movie>> searchMovies(String query) async{
    if ( query.isEmpty ) return [];
    final response = await dio.get('/search/movie', 
      queryParameters: {
        'query': query
      }
    );
    return _jsonToMovies(response.data);    
  }

}