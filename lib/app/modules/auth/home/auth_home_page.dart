import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/extensions/extensions.dart';
import '../../../data/models/user_model.dart';
import '../../core/auth/auth_store.dart';

class AuthHomePage extends StatefulWidget {
  final AuthStore _authStore;

  const AuthHomePage({
    Key? key,
    required AuthStore authStore,
  })  : _authStore = authStore,
        super(key: key);

  @override
  State<AuthHomePage> createState() => _AuthHomePageState();
}

class _AuthHomePageState extends State<AuthHomePage> {
  final reactionDisposers = <ReactionDisposer>[];

  @override
  void initState() {
    super.initState();

    final reactionDisposer =
        reaction<UserModel?>((_) => widget._authStore.userLogged, (userLogged) {
      if (userLogged != null && userLogged.email.isNotEmpty) {
        Modular.to.navigate('/auth/home');
      } else {
        Modular.to.navigate('/auth/login');
      }
    });

    reactionDisposers.add(reactionDisposer);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget._authStore.loadUserLogged();
    });
  }

  @override
  void dispose() {
    for (final reactionDisposer in reactionDisposers) {
      reactionDisposer();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            width: 162.w,
            height: 130.h,
            fit: BoxFit.contain,
          ),
        ),
      );
}
