import 'dart:async';

import '../../../../core/shared/external/adapters/http_adapter_impl.dart';
import '../../../../core/shared/infra/adapters/http_adapter.dart';
import '../../domain/entities/char.dart';
import '../../domain/repositories/chars_repository.dart';
import '../models/char_model.dart';

class CharRepositoryImpl implements CharsRepository {
  // btw, this project don't really need injection dependency..
  // but it is a good practice to use SOLID principles
  final HttpAdapter _httpAdapter = HttpAdapterImpl.create();

  @override
  FutureOr<List<Char>> getChars({limit = 20, offset = 0}) async {
    try {
      final response = await _httpAdapter.get('/characters');
      final data = response.data['data']['results'] as List;
      final charsList = data.whereType<Map<String, dynamic>>().toList();

      final charsModel = charsList.map(CharModel.fromList).toList();
      final charsEntities = charsModel.map((char) => char.toEntity()).toList();

      return charsEntities;
    } catch (_) {
      rethrow;
    }
  }
}
