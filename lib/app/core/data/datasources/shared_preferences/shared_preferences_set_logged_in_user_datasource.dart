import '../../../domain/entities/logged_in_user_entity.dart';
import '../../storages/shared_preferences/repositories/user_repository.dart';
import '../set_logged_in_user_datasource.dart';

class SharedPreferencesSetLoggedInUserDatasource
    implements ISetLoggedInUserDatasource {
  final UserRepositoryDao prefs;

  SharedPreferencesSetLoggedInUserDatasource(this.prefs);

  @override
  Future<bool> call(LoggedInUserEntity user) async {
    bool result = await prefs.setLoggedInUser({
      "id": user.id,
      "name": user.name,
    });

    return result;
  }
}
