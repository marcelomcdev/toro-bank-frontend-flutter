import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/auth_response_datasource.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/custom_snackbar_content.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/shared/components/default_button.dart';
import 'package:toro_bank_frontend/size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({Key? key}) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  Token? response;
  String? email;
  String? password;
  SharedPreferences? prefs;
  late bool _isLoading = false;
  late int userId;

  var datasource = AuthUserResponseDataSource(Dio());

  @override
  void initState() {
    super.initState();
    userId = 0;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        buildEmailFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        buildPasswordFormField(),
        SizedBox(
          height: getProportionateScreenHeight(20),
        ),
        DefaultButton(
          text: "LOGIN",
          pressed: () {
            if ((_formKey.currentState!.validate())) {
              debugPrint('Email: $email Password: $password');
              _isLoading = true;

              Future.delayed(
                const Duration(seconds: 0),
                () async {
                  try {
                    await datasource
                        .authUser("$email", "$password")
                        .then((value) => {response = value, _isLoading = true});

                    var _accessToken = response?.accessToken;
                    debugPrint("Token=$_accessToken");

                    if (_accessToken != '') {
                      prefs = await SharedPreferences.getInstance();
                      await prefs?.setString("token", _accessToken);

                      await datasource
                          .getIdByToken("$_accessToken")
                          .then((value) => userId = value);

                      await prefs?.setInt("userId", userId);

                      debugPrint(
                          "login: id=" + prefs!.getInt("userId").toString());

                      Navigator.pushReplacementNamed(context, '/home');
                    }

                    _isLoading = false;
                  } on AuthDataSourceError catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: CustomSnackBarContent(
                        title: 'Ops!',
                        message: e.message,
                        color: const Color(0xFFC72C41),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ));
                  }

                  _isLoading = false;
                },
              );
            }
          },
          textStyle: const TextStyle(color: Colors.white),
        ),
      ]),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        hintText: "Informe sua senha",
        label: Text("Senha"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Informe uma senha.";
        }
        return null;
      },
      onChanged: (String? value) {
        setState(() {
          password = value;
        });
      },
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value?.isEmpty == true) {
          return 'Informe uma e-mail!';
        }
        return null;
      },
      decoration: const InputDecoration(
        hintText: "Email",
        label: Text("Email"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      onChanged: (String? value) {
        setState(() {
          email = value;
        });
      },
    );
  }
}
