// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaceController on _PlaceControllerBase, Store {
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_PlaceControllerBase.isFormValid'))
          .value;

  final _$placeNameAtom = Atom(name: '_PlaceControllerBase.placeName');

  @override
  String? get placeName {
    _$placeNameAtom.reportRead();
    return super.placeName;
  }

  @override
  set placeName(String? value) {
    _$placeNameAtom.reportWrite(value, super.placeName, () {
      super.placeName = value;
    });
  }

  final _$_PlaceControllerBaseActionController =
      ActionController(name: '_PlaceControllerBase');

  @override
  dynamic setPlaceName(String? value) {
    final _$actionInfo = _$_PlaceControllerBaseActionController.startAction(
        name: '_PlaceControllerBase.setPlaceName');
    try {
      return super.setPlaceName(value);
    } finally {
      _$_PlaceControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
placeName: ${placeName},
isFormValid: ${isFormValid}
    ''';
  }
}
