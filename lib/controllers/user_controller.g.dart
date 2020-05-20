// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  final _$userDataAtom = Atom(name: '_UserControllerBase.userData');

  @override
  UserData get userData {
    _$userDataAtom.reportRead();
    return super.userData;
  }

  @override
  set userData(UserData value) {
    _$userDataAtom.reportWrite(value, super.userData, () {
      super.userData = value;
    });
  }

  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  User get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$getInfoMundoAsyncAction =
      AsyncAction('_UserControllerBase.getInfoMundo');

  @override
  Future getInfoMundo(String email, String password) {
    return _$getInfoMundoAsyncAction
        .run(() => super.getInfoMundo(email, password));
  }

  @override
  String toString() {
    return '''
userData: ${userData},
user: ${user}
    ''';
  }
}
