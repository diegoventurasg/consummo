import '../../../../../core/data/storages/sqflite/repositories/user_repository.dart';
import '../../../domain/entities/user_entity.dart';
import '../add_user_datasource.dart';

class SqfliteAddUserDatasource implements IAddUserDatasource {
  final UserRepositoryDao db;

  SqfliteAddUserDatasource(this.db);

  @override
  Future<int?> call({required UserEntity user}) async {
    final generatedId = await db.insert({
      "id": user.id,
      "name": user.name,
    });

    return generatedId;
  }
}
