import 'package:dartz/dartz.dart';

import '../../domain/entities/logged_in_user_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/repositories/get_logged_in_user_repository.dart';
import '../datasources/get_logged_in_user_datasource.dart';

class GetLoggedInUserRepositoryImpl implements IGetLoggedInUserRepository {
  final IGetLoggedInUserDatasource datasource;

  GetLoggedInUserRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, LoggedInUserEntity>> getLoggedInUser() async {
    try {
      final user = await datasource();
      return user == null ? left(DatasourceNull()) : right(user);
    } catch (e) {
      return left(InternalError());
    }
  }
}
