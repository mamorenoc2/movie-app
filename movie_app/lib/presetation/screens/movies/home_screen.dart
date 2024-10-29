import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HomeMoveScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeMoveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Text(dotenv.env['THE_MOVIEDB_KEY'] ?? 'NO HAY API KEY'),
      ),
    );
  }
}