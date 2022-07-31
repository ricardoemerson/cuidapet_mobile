import 'package:mobx/mobx.dart';

import '../../../data/models/user_model.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @readonly
  UserModel? _userLogged;

  @action
  Future<void> loadUserLogged() async {
    _userLogged = UserModel.empty();

    Future.delayed(const Duration(seconds: 3), () {
      _userLogged = UserModel.fromMap({'email': 'ricardo_emerson@yahoo.com.br'});
    });
  }
}
