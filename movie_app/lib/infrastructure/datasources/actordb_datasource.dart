import 'package:dio/dio.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/domain/datasources/actors_datasources.dart';
import 'package:movie_app/domain/entities/actor.dart';
import 'package:movie_app/infrastructure/mappers/actor_mapper.dart';
import 'package:movie_app/infrastructure/models/credit_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key': Enviroment.movieDBkey,
      'language': 'es-MX'
    }
  ));
  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async{
    
    final response = await dio.get(
      '/movie/$movieId/credits'
    );
    final castResponse = CreditsResponse.fromJson(response.data);
    List<Actor> actors = castResponse.cast.map(
      (cast) => ActorMapper.castToEntity(cast)
    ).toList();
    
    return actors;
  }
}