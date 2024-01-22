import 'package:flutter/material.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          "It's Time To Test Your Knowledge",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        Text(
          "Choose One Of The Following Quizes",
          style: TextStyle(
            fontWeight: FontWeight.w200,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
