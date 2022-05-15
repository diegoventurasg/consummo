import '../../domain/entities/user_entity.dart';

abstract class IGetUserListDatasource {
  Future<List<UserEntity>?> call();
}
