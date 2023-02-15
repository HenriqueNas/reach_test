import 'dart:async';

import '../domain/entities/char.dart';
import '../domain/useCases/get_chars.dart';

class HomeController {
  final _getChars = GetChars();

  Future<List<Char>> loadChars() async {
    final chars = await _getChars();

    return chars;
  }
}
