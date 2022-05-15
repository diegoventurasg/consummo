// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AddUserController on _AddUserControllerBase, Store {
  Computed<bool>? _$isUserNameValidComputed;

  @override
  bool get isUserNameValid =>
      (_$isUserNameValidComputed ??= Computed<bool>(() => super.isUserNameValid,
              name: '_AddUserControllerBase.isUserNameValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: '_AddUserControllerBase.isFormValid'))
          .value;

  final _$userNameAtom = Atom(name: '_AddUserControllerBase.userName');

  @override
  String? get userName {
    _$userNameAtom.reportRead();
    return super.userName;
  }

  @override
  set userName(String? value) {
    _$userNameAtom.reportWrite(value, super.userName, () {
      super.userName = value;
    });
  }

  final _$_AddUserControllerBaseActionController =
      ActionController(name: '_AddUserControllerBase');

  @override
  dynamic setUserName(String? value) {
    final _$actionInfo = _$_AddUserControllerBaseActionController.startAction(
        name: '_AddUserControllerBase.setUserName');
    try {
      return super.setUserName(value);
    } finally {
      _$_AddUserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userName: ${userName},
isUserNameValid: ${isUserNameValid},
isFormValid: ${isFormValid}
    ''';
  }
}
