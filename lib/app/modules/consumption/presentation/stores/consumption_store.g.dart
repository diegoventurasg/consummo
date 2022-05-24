// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsumptionStore on _ConsumptionStoreBase, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ConsumptionStoreBase.isLoading'))
          .value;

  final _$stateAtom = Atom(name: '_ConsumptionStoreBase.state');

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

  final _$addConsumptionAsyncAction =
      AsyncAction('_ConsumptionStoreBase.addConsumption');

  @override
  Future<void> addConsumption(ConsumptionEntity consumption) {
    return _$addConsumptionAsyncAction
        .run(() => super.addConsumption(consumption));
  }

  final _$updateConsumptionAsyncAction =
      AsyncAction('_ConsumptionStoreBase.updateConsumption');

  @override
  Future<void> updateConsumption(ConsumptionEntity consumption) {
    return _$updateConsumptionAsyncAction
        .run(() => super.updateConsumption(consumption));
  }

  final _$deleteConsumptionAsyncAction =
      AsyncAction('_ConsumptionStoreBase.deleteConsumption');

  @override
  Future<bool> deleteConsumption(ConsumptionEntity consumption) {
    return _$deleteConsumptionAsyncAction
        .run(() => super.deleteConsumption(consumption));
  }

  final _$_ConsumptionStoreBaseActionController =
      ActionController(name: '_ConsumptionStoreBase');

  @override
  dynamic update(AppState value) {
    final _$actionInfo = _$_ConsumptionStoreBaseActionController.startAction(
        name: '_ConsumptionStoreBase.update');
    try {
      return super.update(value);
    } finally {
      _$_ConsumptionStoreBaseActionController.endAction(_$actionInfo);
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
