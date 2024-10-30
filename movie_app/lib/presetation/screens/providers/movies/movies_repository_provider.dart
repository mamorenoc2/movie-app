
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/moviedb_datasource.dart';
import 'package:movie_app/infrastructure/repositories/movie_repository_impl.dart';

// Este repositorio es inmutable, por lo tanto es un provider de lectura, sin embargo esto me permite cambiar facilmente el datasource de la
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MovieDatasource() );
});

