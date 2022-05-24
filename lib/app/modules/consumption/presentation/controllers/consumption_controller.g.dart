// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConsumptionController on _ConsumptionControllerBase, Store {
  Computed<bool>? _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_ConsumptionControllerBase.isNameValid'))
          .value;
  Computed<bool>? _$isUnitValidComputed;

  @override
  bool get isUnitValid =>
      (_$isUnitValidComputed ??= Computed<bool>(() => super.isUnitValid,
              name: '_ConsumptionControllerBase.isUnitValid'))
          .value;
  Computed<bool>? _$isColorValidComputed;

  @override
  bool get isColorValid =>
      (_$isColorValidComputed ??= Computed<bool>(() => super.isColorValid,
              name: '_ConsumptionControllerBase.isColorValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_ConsumptionControllerBase.isFormValid'))
          .value;

  final _$nameAtom = Atom(name: '_ConsumptionControllerBase.name');

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$unitAtom = Atom(name: '_ConsumptionControllerBase.unit');

  @override
  String? get unit {
    _$unitAtom.reportRead();
    return super.unit;
  }

  @override
  set unit(String? value) {
    _$unitAtom.reportWrite(value, super.unit, () {
      super.unit = value;
    });
  }

  final _$colorAtom = Atom(name: '_ConsumptionControllerBase.color');

  @override
  int? get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(int? value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$_ConsumptionControllerBaseActionController =
      ActionController(name: '_ConsumptionControllerBase');

  @override
  dynamic setName(String? value) {
    final _$actionInfo = _$_ConsumptionControllerBaseActionController
        .startAction(name: '_ConsumptionControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_ConsumptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setUnit(String? value) {
    final _$actionInfo = _$_ConsumptionControllerBaseActionController
        .startAction(name: '_ConsumptionControllerBase.setUnit');
    try {
      return super.setUnit(value);
    } finally {
      _$_ConsumptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setColor(int? value) {
    final _$actionInfo = _$_ConsumptionControllerBaseActionController
        .startAction(name: '_ConsumptionControllerBase.setColor');
    try {
      return super.setColor(value);
    } finally {
      _$_ConsumptionControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
unit: ${unit},
color: ${color},
isNameValid: ${isNameValid},
isUnitValid: ${isUnitValid},
isColorValid: ${isColorValid},
isFormValid: ${isFormValid}
    ''';
  }
}
