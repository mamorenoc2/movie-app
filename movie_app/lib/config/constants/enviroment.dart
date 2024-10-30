import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static String movieDBkey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'NO HAY API KEY';
}