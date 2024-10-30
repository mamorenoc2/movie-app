
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/infrastructure/datasources/actordb_datasource.dart';
import 'package:movie_app/infrastructure/repositories/actor_repository_impl.dart';

// Este repositorio es inmutable, por lo tanto es un provider de lectura, sin embargo esto me permite cambiar facilmente el datasource de la
final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});