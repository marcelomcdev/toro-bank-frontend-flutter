import 'package:flutter/material.dart';
import 'package:toro_bank_frontend/constants.dart';

class DefaultButtom extends StatelessWidget {
  final String text;
  final VoidCallback? pressed;
  final bool disabled;

  const DefaultButtom({
    Key? key,
    required this.text,
    this.pressed,
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(0),
        padding: const EdgeInsets.all(13.0),
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: Stack(
                children: <Widget>[
                  Positioned.fill(
                      child: Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: <Color>[
                      Color.fromARGB(255, 42, 2, 87),
                      Color.fromARGB(255, 63, 13, 121),
                      Color.fromARGB(255, 90, 15, 177),
                    ])),
                  )),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 110, vertical: 15),
                        primary: Colors.white,
                        backgroundColor:
                            disabled ? Colors.grey : kToroTextColor,
                        textStyle: const TextStyle(fontSize: 20)),
                    onPressed: disabled ? null : pressed,
                    child: Text(text),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}