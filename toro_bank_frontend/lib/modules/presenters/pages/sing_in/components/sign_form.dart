import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toro_bank_frontend/modules/domain/entities/token.dart';
import 'package:toro_bank_frontend/modules/domain/errors/errors.dart';
import 'package:toro_bank_frontend/modules/presenters/datasources/auth_response_datasource.dart';
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
        //FormError(errors: errors),
        DefaultButton(
          text: "LOGIN",
          pressed: () {
            if ((_formKey.currentState!.validate())) {
              debugPrint('Email: $email Password: $password');
              _isLoading = true;
              //validar o login e senha
              //se passar, navegar para home
              //se nao passar, mostrar mensagem de erro em algum lugar.

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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Stack(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 48,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Ops!",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          e.message,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 14),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              height: 90,
                              decoration: const BoxDecoration(
                                  color: Color(0xFFC72C41),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20))),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 10,
                              child: Lottie.asset(
                                  'assets/json/tomato-error.json',
                                  width: 50,
                                  height: 50),
                            ),
                          ],
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    );
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
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        hintText: "Informe sua senha",
        label: const Text("Senha"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Lock.svg")
      ),
      validator: (value) {
        // if (value == null || value.isEmpty) {
        //   setState(() {
        //     errors.add("Por favor, informe sua senha");
        //   });
        // }
        //return null;
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
      // ignore: prefer_const_constructors
      decoration: InputDecoration(
        hintText: "Email",
        label: const Text("Email"),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        //suffixIcon: const CustomSuffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
      onChanged: (String? value) {
        setState(() {
          email = value;
        });
      },
    );
  }
}
