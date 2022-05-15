// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'logged_in_user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoggedInUserStore on _LoggedInUserStoreBase, Store {
  final _$stateAtom = Atom(name: '_LoggedInUserStoreBase.state');

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

  final _$getAsyncAction = AsyncAction('_LoggedInUserStoreBase.get');

  @override
  Future<void> get() {
    return _$getAsyncAction.run(() => super.get());
  }

  final _$setAsyncAction = AsyncAction('_LoggedInUserStoreBase.set');

  @override
  Future<void> set(LoggedInUserEntity user) {
    return _$setAsyncAction.run(() => super.set(user));
  }

  final _$_LoggedInUserStoreBaseActionController =
      ActionController(name: '_LoggedInUserStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_LoggedInUserStoreBaseActionController.startAction(
        name: '_LoggedInUserStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_LoggedInUserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
