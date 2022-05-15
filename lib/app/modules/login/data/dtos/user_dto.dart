import '../../domain/entities/user_entity.dart';

extension UserDto on UserEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static UserEntity fromMap(Map<String, dynamic> map) {
    return UserEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
