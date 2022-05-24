// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsumptionListStore on _ConsumptionListStoreBase, Store {
  final _$stateAtom = Atom(name: '_ConsumptionListStoreBase.state');

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

  final _$getAsyncAction = AsyncAction('_ConsumptionListStoreBase.get');

  @override
  Future<void> get(int userId) {
    return _$getAsyncAction.run(() => super.get(userId));
  }

  final _$_ConsumptionListStoreBaseActionController =
      ActionController(name: '_ConsumptionListStoreBase');

  @override
  void update(AppState value) {
    final _$actionInfo = _$_ConsumptionListStoreBaseActionController
        .startAction(name: '_ConsumptionListStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_ConsumptionListStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
