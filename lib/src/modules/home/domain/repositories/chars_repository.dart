import 'dart:async';

import '../entities/char.dart';

abstract class CharsRepository {
  FutureOr<List<Char>> getChars({limit = 20, offset = 0});
}
