// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserListStore on _UserListStoreBase, Store {
  final _$stateAtom = Atom(name: '_UserListStoreBase.state');

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

  final _$fetchAsyncAction = AsyncAction('_UserListStoreBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$_UserListStoreBaseActionController =
      ActionController(name: '_UserListStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_UserListStoreBaseActionController.startAction(
        name: '_UserListStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_UserListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
