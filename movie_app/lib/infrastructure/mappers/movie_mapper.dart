/** Este archivo es el enlace entre el modelo que se tenga de la API y la entidad, esto me permite cambiar diferentes modelos de diferentes API's sin que se tenga que cambiar el modelo por completo en todo el código */

import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/infrastructure/models/singular_moviedb.dart';


class MovieMapper {
  static Movie movieDBToEntity(SingularMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.backdropPath }'
        : 'https://n9.cl/w1dqyo',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}