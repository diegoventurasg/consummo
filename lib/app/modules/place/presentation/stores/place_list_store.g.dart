// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaceListStore on _PlaceListStoreBase, Store {
  final _$stateAtom = Atom(name: '_PlaceListStoreBase.state');

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

  final _$getAsyncAction = AsyncAction('_PlaceListStoreBase.get');

  @override
  Future<void> get(int userId) {
    return _$getAsyncAction.run(() => super.get(userId));
  }

  final _$_PlaceListStoreBaseActionController =
      ActionController(name: '_PlaceListStoreBase');

  @override
  void update(AppState value) {
    final _$actionInfo = _$_PlaceListStoreBaseActionController.startAction(
        name: '_PlaceListStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_PlaceListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
