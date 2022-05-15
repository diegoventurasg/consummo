import 'package:dartz/dartz.dart';

import '../../../../core/domain/errors/errors.dart';
import '../../domain/entities/place_entity.dart';
import '../../domain/repositories/get_place_list_repository.dart';
import '../datasources/get_place_list_datasource.dart';

class GetPlaceListRepositoryImpl implements IGetPlaceListRespository {
  final IGetPlaceListDatasource datasource;

  GetPlaceListRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<PlaceEntity>>> getPlaceList(int userId) async {
    try {
      final list = await datasource(userId);
      return list == null ? left(DatasourceNull()) : right(list);
    } catch (e) {
      return left(InternalError());
    }
  }
}
