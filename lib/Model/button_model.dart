import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  const Button({required this.page, required this.text, super.key});

  final Widget page;
  final String text;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.7,
      height: MediaQuery.of(context).size.height * 0.09,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => widget.page));
        },
        child: Text(
          widget.text,
          style: const TextStyle(fontSize: 17),
        ),
      ),
    );
  }
}
