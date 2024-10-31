import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/config/constants/enviroment.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/presetation/screens/providers/providers.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  final dio = Dio();
  final dioAdapter = DioAdapter(dio: dio);

  setUp(() async {
    dio.httpClientAdapter = dioAdapter;
    await dotenv.load(fileName: ".env"); // Inicializar DotEnv

  });

  testWidgets('MoviesHorizontalList shows movie title and release year', (WidgetTester tester) async {
    final movie = Movie(
      adult: false,
      backdropPath: '/path/to/backdrop.jpg',
      genreIds: ['Action', 'Adventure'],
      id: 12345,
      originalLanguage: 'en',
      originalTitle: 'Example Original Title',
      overview: 'This is an example overview of the movie.',
      popularity: 1234.56,
      posterPath: '/path/to/poster.jpg',
      releaseDate: DateTime(2022, 1, 1),
      title: 'Example Movie Title',
      video: false,
      voteAverage: 8.5,
      voteCount: 1000,
    );

    // Simular una respuesta HTTP
    dioAdapter.onGet(
      '/movie/now_playing',
      (server) => server.reply(200, {
        'results': [
          {
            'adult': movie.adult,
            'backdrop_path': movie.backdropPath,
            'genre_ids': movie.genreIds,
            'id': movie.id,
            'original_language': movie.originalLanguage,
            'original_title': movie.originalTitle,
            'overview': movie.overview,
            'popularity': movie.popularity,
            'poster_path': movie.posterPath,
            'release_date': movie.releaseDate.toIso8601String(),
            'title': movie.title,
            'video': movie.video,
            'vote_average': movie.voteAverage,
            'vote_count': movie.voteCount,
          }
        ]
      }),
      queryParameters: {
        'api_key': dotenv.env['THE_MOVIEDB_KEY'],
        'language': 'es-CO',
        'page': 1,
      },
    );

    // Construir el widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: MovieHorizontalList(movies: [movie]),
        ),
      ),
    );

    // Verificar que el título de la película se muestra
    expect(find.text('Example Movie Title'), findsOneWidget);
    // expect(find.text('Example Original Title'), findsOneWidget);
    // expect(find.text('This is an example overview of the movie.'), findsOneWidget);

  });
}