// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PlaceListController on _PlaceListControllerBase, Store {
  final _$isEditingAtom = Atom(name: '_PlaceListControllerBase.isEditing');

  @override
  bool get isEditing {
    _$isEditingAtom.reportRead();
    return super.isEditing;
  }

  @override
  set isEditing(bool value) {
    _$isEditingAtom.reportWrite(value, super.isEditing, () {
      super.isEditing = value;
    });
  }

  final _$_PlaceListControllerBaseActionController =
      ActionController(name: '_PlaceListControllerBase');

  @override
  void toggleEditing() {
    final _$actionInfo = _$_PlaceListControllerBaseActionController.startAction(
        name: '_PlaceListControllerBase.toggleEditing');
    try {
      return super.toggleEditing();
    } finally {
      _$_PlaceListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isEditing: ${isEditing}
    ''';
  }
}
