import 'package:movie_app/domain/datasources/actors_datasources.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/domain/repositories/actors_repositories.dart';

class ActorRepositoryImpl extends ActorsRepository {
  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);
  @override
  Future<List<Actor>> getActorsByMovie(String movieId){
    return datasource.getActorsByMovie(movieId);
  }
}