import '../../domain/entities/logged_in_user_entity.dart';

extension LoggedInUserDto on LoggedInUserEntity {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  static LoggedInUserEntity fromMap(Map<String, dynamic> map) {
    return LoggedInUserEntity(
      id: map['id'],
      name: map['name'],
    );
  }
}
