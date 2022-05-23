import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomSnackBarContent extends StatelessWidget {
  const CustomSnackBarContent({
    Key? key,
    required this.title,
    required this.message,
    this.color,
  }) : super(key: key);
  final Color? color;
  final String message;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      message,
                      style: const TextStyle(color: Colors.white, fontSize: 14),
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
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
        Positioned(
          bottom: 20,
          left: 10,
          child: Lottie.asset('assets/json/tomato-error.json',
              width: 50, height: 50),
        ),
      ],
    );
  }
}
