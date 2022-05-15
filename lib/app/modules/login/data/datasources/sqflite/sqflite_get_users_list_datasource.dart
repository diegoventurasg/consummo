import '../../../../../core/data/storages/sqflite/repositories/user_repository.dart';
import '../../../domain/entities/user_entity.dart';
import '../../dtos/user_dto.dart';
import '../get_user_list_datasource.dart';

class SqfliteGetUserListDatasource implements IGetUserListDatasource {
  final UserRepositoryDao db;

  SqfliteGetUserListDatasource(this.db);

  @override
  Future<List<UserEntity>?> call() async {
    final list = (await db.getAll())?.map((e) => UserDto.fromMap(e)).toList();
    return list;
  }
}
