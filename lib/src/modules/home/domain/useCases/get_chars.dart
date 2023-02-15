import '../../infra/repositories/char_repository_impl.dart';
import '../entities/char.dart';
import '../repositories/chars_repository.dart';

class GetChars {
  final CharsRepository _repository = CharRepositoryImpl();

  Future<List<Char>> call() async {
    try {
      final chars = await _repository.getChars();

      return chars;
    } catch (_) {
      throw Exception('Error on get chars');
    }
  }
}
