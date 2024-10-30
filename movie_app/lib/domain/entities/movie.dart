//Este se podría decir que es el modelo propio del proyecto, que será definido independientemente del la API y el modelo que tenga estructurado la Api, si se cambia de API y se quiere adaptar a esta entidad, entonces se cambia el mapeo de los datos, pero esto no se toca, es trasversal a todas las bases de datos

class Movie {
  final bool adult; //Clasifica si es contenido de adultos
  final String backdropPath; 
  final List<String> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterPath;
  final DateTime releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;

  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount
  });
}