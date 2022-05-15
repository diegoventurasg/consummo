import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/add_user_repository.dart';
import '../datasources/add_user_datasource.dart';

class AddUserRepositoryImpl implements IAddUserRepository {
  final IAddUserDatasource datasource;

  AddUserRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, int>> call({required UserEntity user}) async {
    try {
      final generatedId = await datasource(user: user);
      return generatedId == null ? left(DatasourceNull()) : right(generatedId);
    } catch (e) {
      return left(InternalError());
    }
  }
}
