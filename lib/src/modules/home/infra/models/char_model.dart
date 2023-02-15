import '../../domain/entities/char.dart';

class CharModel extends Char {
  const CharModel({
    required super.id,
    required super.name,
    required super.description,
    required super.thumbnail,
  });

  Char toEntity() {
    return Char(
      id: id,
      name: name,
      description: description,
      thumbnail: thumbnail,
    );
  }

  factory CharModel.empty() {
    return CharModel(
      id: 0,
      name: 'No name',
      description: 'No description',
      thumbnail: 'No thumbnail',
    );
  }

  static CharModel fromList(Map<String, dynamic> map) {
    final thumbnailPath = map['thumbnail']['path'] ?? '';
    final thumbnailExtension = map['thumbnail']['extension'] ?? '';

    return CharModel(
      id: map['id'],
      name: map['name'] ?? 'No name',
      description: map['description'] ?? 'No description',
      thumbnail: '$thumbnailPath.$thumbnailExtension',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnail': thumbnail,
    };
  }
}
