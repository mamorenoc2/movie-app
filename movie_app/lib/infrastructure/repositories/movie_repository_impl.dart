import 'package:movie_app/domain/datasources/movies_datasources.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/repositories/movies_repository.dart';

/**Esta es la implementación del repositorio,  */

class MovieRepositoryImpl extends MoviesRepository {

  final MoviesDatasource datasource;
  MovieRepositoryImpl(this.datasource);

  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

    @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }

}