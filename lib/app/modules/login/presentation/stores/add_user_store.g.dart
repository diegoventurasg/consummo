// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddUserStore on _AddUserStoreBase, Store {
  final _$stateAtom = Atom(name: '_AddUserStoreBase.state');

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

  final _$saveAsyncAction = AsyncAction('_AddUserStoreBase.save');

  @override
  Future<void> save(UserEntity newUser) {
    return _$saveAsyncAction.run(() => super.save(newUser));
  }

  final _$_AddUserStoreBaseActionController =
      ActionController(name: '_AddUserStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_AddUserStoreBaseActionController.startAction(
        name: '_AddUserStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_AddUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
