// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_place_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedPlaceStore on _SelectedPlaceStoreBase, Store {
  final _$stateAtom = Atom(name: '_SelectedPlaceStoreBase.state');

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

  final _$getAsyncAction = AsyncAction('_SelectedPlaceStoreBase.get');

  @override
  Future<void> get(int userId) {
    return _$getAsyncAction.run(() => super.get(userId));
  }

  final _$setAsyncAction = AsyncAction('_SelectedPlaceStoreBase.set');

  @override
  Future<void> set(SelectedPlaceEntity place) {
    return _$setAsyncAction.run(() => super.set(place));
  }

  final _$_SelectedPlaceStoreBaseActionController =
      ActionController(name: '_SelectedPlaceStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_SelectedPlaceStoreBaseActionController.startAction(
        name: '_SelectedPlaceStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_SelectedPlaceStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
