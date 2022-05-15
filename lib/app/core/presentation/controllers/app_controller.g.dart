// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppController on _AppControllerBase, Store {
  Computed<bool>? _$isUserLoggedComputed;

  @override
  bool get isUserLogged =>
      (_$isUserLoggedComputed ??= Computed<bool>(() => super.isUserLogged,
              name: '_AppControllerBase.isUserLogged'))
          .value;
  Computed<LoggedInUserEntity?>? _$loggedInUserComputed;

  @override
  LoggedInUserEntity? get loggedInUser => (_$loggedInUserComputed ??=
          Computed<LoggedInUserEntity?>(() => super.loggedInUser,
              name: '_AppControllerBase.loggedInUser'))
      .value;
  Computed<bool>? _$hadPlaceSelectedComputed;

  @override
  bool get hadPlaceSelected => (_$hadPlaceSelectedComputed ??= Computed<bool>(
          () => super.hadPlaceSelected,
          name: '_AppControllerBase.hadPlaceSelected'))
      .value;
  Computed<SelectedPlaceEntity?>? _$selectedPlaceComputed;

  @override
  SelectedPlaceEntity? get selectedPlace => (_$selectedPlaceComputed ??=
          Computed<SelectedPlaceEntity?>(() => super.selectedPlace,
              name: '_AppControllerBase.selectedPlace'))
      .value;

  @override
  String toString() {
    return '''
isUserLogged: ${isUserLogged},
loggedInUser: ${loggedInUser},
hadPlaceSelected: ${hadPlaceSelected},
selectedPlace: ${selectedPlace}
    ''';
  }
}
