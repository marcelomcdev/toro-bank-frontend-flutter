import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/size_config.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.errors,
  }) : super(key: key);

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: getProportionateScreenWidth(10),
        ),
        Text(errors.isNotEmpty ? errors[0] : ''),
      ],
    );
  }
}
