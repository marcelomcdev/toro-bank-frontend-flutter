import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/sing_in/components/body.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.transparent,
      ),
      body: const Body(),
    );
  }
}
