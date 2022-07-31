import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('LoginPage'),
        ),
        body: const Center(
          child: Text('Scaffold Body'),
        ),
      );
}
