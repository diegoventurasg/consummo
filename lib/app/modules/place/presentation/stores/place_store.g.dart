// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaceStore on _PlaceStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_PlaceStoreBase.isLoading'))
          .value;

  final _$stateAtom = Atom(name: '_PlaceStoreBase.state');

  @override
  AppState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(AppState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  final _$addPlaceAsyncAction = AsyncAction('_PlaceStoreBase.addPlace');

  @override
  Future<void> addPlace(PlaceEntity place) {
    return _$addPlaceAsyncAction.run(() => super.addPlace(place));
  }

  final _$updatePlaceAsyncAction = AsyncAction('_PlaceStoreBase.updatePlace');

  @override
  Future<void> updatePlace(PlaceEntity place) {
    return _$updatePlaceAsyncAction.run(() => super.updatePlace(place));
  }

  final _$deletePlaceAsyncAction = AsyncAction('_PlaceStoreBase.deletePlace');

  @override
  Future<bool> deletePlace(PlaceEntity place) {
    return _$deletePlaceAsyncAction.run(() => super.deletePlace(place));
  }

  final _$_PlaceStoreBaseActionController =
      ActionController(name: '_PlaceStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_PlaceStoreBaseActionController.startAction(
        name: '_PlaceStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_PlaceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state},
isLoading: ${isLoading}
    ''';
  }
}
