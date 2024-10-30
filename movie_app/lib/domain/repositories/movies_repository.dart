// Clase abstracta porque no necesito crear más instancias de aquí

import 'package:movie_app/domain/entities/movie.dart';


//Los repositorios llaman al datasource
abstract class MoviesRepository {
  //El paginado de las películas
  Future <List<Movie>> getNowPlaying ({ int page = 1});
  Future<Movie> getMovieById( String id );

}