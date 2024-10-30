import 'package:flutter/material.dart';
import 'package:movie_app/config/constants/enviroment.dart';

class HomeMoveScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeMoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text(Enviroment.movieDBkey),
      ),
    );
  }
}