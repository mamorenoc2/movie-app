import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/presetation/screens/providers/movies/initial_loading_provider.dart';
import 'package:movie_app/presetation/screens/providers/movies/movies_slideshow_provider.dart';
import 'package:movie_app/presetation/screens/providers/providers.dart';
import 'package:movie_app/presetation/screens/widgets/shared/fullscreen_loader.dart';



class HomeMoveScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeMoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView()
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {

  @override
  @override
  void initState() {
    super.initState();
    
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
  }


  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if ( initialLoading ) return const FullScreenLoader();
    
    final slideShowMovies = ref.watch( moviesSlideshowProvider );
    final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider );
    final popularMovies = ref.watch( popularMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );
    final upcomingMovies = ref.watch( upcomingMoviesProvider );

    final moviesSlideshow = ref.watch( moviesSlideshowProvider );
    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: AppbarMovie(),
          ),
        ),


        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
              return Column(
                  children: [
              
              
                    MoviesSlideshow(movies: slideShowMovies ),
              
                    MovieHorizontalList(
                      movies: nowPlayingMovies,
                      title: 'En cines',
                      subTitle: 'Lunes 20',
                      loadNextPage: () =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage()
                      
                    ),
              
                    MovieHorizontalList(
                      movies: popularMovies,
                      title: 'Populares',
                      // subTitle: '',
                      loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage()
                    ),
              
                    MovieHorizontalList(
                      movies: topRatedMovies,
                      title: 'Mejor calificadas',
                      subTitle: 'Desde siempre',
                      loadNextPage: () =>ref.read(topRatedMoviesProvider.notifier).loadNextPage()
                    ),

                    const SizedBox( height: 10 ),
              
              
                  ],
                );
          },
          childCount: 1
        )),

      ]
    );
  
    
  }
}