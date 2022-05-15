import 'package:mobx/mobx.dart';

import '../../domain/entities/logged_in_user_entity.dart';
import '../../domain/entities/selected_place_entity.dart';
import '../stores/logged_in_user_store.dart';
import '../stores/selected_place_store.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final LoggedInUserStore loggedInUserStore;
  final SelectedPlaceStore selectedPlaceStore;

  _AppControllerBase(
    this.loggedInUserStore,
    this.selectedPlaceStore,
  );

  @computed
  bool get isUserLogged => loggedInUserStore.state.when(
        success: (data) => true,
        orElse: () => false,
      );

  @computed
  LoggedInUserEntity? get loggedInUser => loggedInUserStore.state.when(
        success: (data) => data,
        orElse: () => null,
      );

  Future<void> initApp() async {
    await getLoggedInUser();
    await getSelectedPlace();
  }

  Future<void> getLoggedInUser() async {
    await loggedInUserStore.get();
  }

  Future<void> setLoggedInUser(LoggedInUserEntity user) async {
    await loggedInUserStore.set(user);
  }

  @computed
  bool get hadPlaceSelected => selectedPlaceStore.state.when(
        success: (data) => true,
        orElse: () => false,
      );

  Future<void> getSelectedPlace() async {
    if (isUserLogged) await selectedPlaceStore.get(loggedInUser!.id);
  }

  Future<void> setSelectedPlace(SelectedPlaceEntity place) async {
    await selectedPlaceStore.set(place);
  }

  @computed
  SelectedPlaceEntity? get selectedPlace => selectedPlaceStore.state.when(
        success: (data) => data,
        orElse: () => null,
      );
}
