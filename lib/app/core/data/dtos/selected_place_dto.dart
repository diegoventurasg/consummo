import '../../domain/entities/selected_place_entity.dart';

extension SelectedPlaceDto on SelectedPlaceEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'user_id': userId,
    };
  }

  static SelectedPlaceEntity fromMap(Map<String, dynamic> map) {
    return SelectedPlaceEntity(
      id: map['id'],
      name: map['name'],
      userId: map['user_id'],
    );
  }
}
