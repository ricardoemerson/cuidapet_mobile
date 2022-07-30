import 'package:flutter/material.dart';

import '../../../core/extensions/extensions.dart';

class AuthHomePage extends StatelessWidget {
  const AuthHomePage({Key? key}) : super(key: key);

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
