import '../../domain/entities/place_entity.dart';

extension PlaceDto on PlaceEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user_id': userId,
    };
  }

  static PlaceEntity fromMap(Map<String, dynamic> map) {
    return PlaceEntity(
      id: map['id'],
      name: map['name'],
      userId: map['user_id'],
    );
  }
}
