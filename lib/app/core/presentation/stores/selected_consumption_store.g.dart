// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'selected_consumption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SelectedConsumptionStore on _SelectedConsumptionStoreBase, Store {
  final _$stateAtom = Atom(name: '_SelectedConsumptionStoreBase.state');

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

  final _$setAsyncAction = AsyncAction('_SelectedConsumptionStoreBase.set');

  @override
  Future<void> set(SelectedConsumptionEntity consumption) {
    return _$setAsyncAction.run(() => super.set(consumption));
  }

  final _$_SelectedConsumptionStoreBaseActionController =
      ActionController(name: '_SelectedConsumptionStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_SelectedConsumptionStoreBaseActionController
        .startAction(name: '_SelectedConsumptionStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_SelectedConsumptionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
state: ${state}
    ''';
  }
}
