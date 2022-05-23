import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/modules/presenters/pages/sing_in/components/sign_form.dart';
import 'package:toro_bank_frontend/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SingleChildScrollView(
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30),
                vertical: getProportionateScreenHeight(20)),
            child: Column(children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: getProportionateScreenHeight(10)),
                child: Image.asset(
                  'assets/images/toro.png',
                  height: getProportionateScreenHeight(84),
                  width: getProportionateScreenWidth(84),
                ),
              ),
              const Text(
                "Vamos começar?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Faça o login com seu e-mail e senha. \npara ter acesso aos nossos serviços.",
                textAlign: TextAlign.center,
              ),
              const SignForm(),
            ]),
          ),
        ),
      ),
    );
  }
}
