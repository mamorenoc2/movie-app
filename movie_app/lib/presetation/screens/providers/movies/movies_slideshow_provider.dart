import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/domain/entities/movie.dart';

import 'movies_providers.dart';



//Este provider sirve para manejar el estado del carrusel, que solo muestre 6
final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  
  final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );

  if ( nowPlayingMovies.isEmpty ) return [];

  return nowPlayingMovies.sublist(0,6);

});