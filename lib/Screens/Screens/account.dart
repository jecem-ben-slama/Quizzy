import 'package:flutter/material.dart';
import '../HomePage/home.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Text("this you account"),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage()));
      }),
    );
  }
}
