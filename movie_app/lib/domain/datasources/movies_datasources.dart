// Clase abstracta porque no necesito crear más instancias de aquí

import 'package:dio/dio.dart';
import 'package:movie_app/domain/entities/movie.dart';


//Se llama el dataSource y no el repositorio, porque el repositorio me permite cambiar el repositorio (El origen de datos)

abstract class MoviesDatasource {

  @override
  Future <List<Movie>> getNowPlaying ({ int page = 1});
  
}