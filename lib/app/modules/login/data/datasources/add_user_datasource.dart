import '../../domain/entities/user_entity.dart';

abstract class IAddUserDatasource {
  Future<int?> call({required UserEntity user});
}
