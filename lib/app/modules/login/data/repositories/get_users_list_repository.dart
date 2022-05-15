import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/get_user_list_repository.dart';
import '../datasources/get_user_list_datasource.dart';

class GetUserListRepositoryImpl implements IGetUserListRepository {
  final IGetUserListDatasource datasource;

  GetUserListRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<UserEntity>>> call() async {
    try {
      final list = await datasource();
      return list == null ? left(DatasourceNull()) : right(list);
    } catch (e) {
      return left(InternalError());
    }
  }
}
