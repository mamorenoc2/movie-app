// Clase abstracta porque no necesito crear más instancias de aquí

import 'package:movie_app/domain/entities/movie.dart';


//Los repositorios llaman al datasource
abstract class MovieRepository {
  //El paginado de las películas
  Future <List<Movie>> getNowPlaying ({ int page = 1});
}