// ignore_for_file: empty_catches

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quizzy/Screens/Created-Quiz/create_quiz.dart';
import 'package:quizzy/Screens/HomePage/home.dart';
import 'package:quizzy/Screens/Screens/more_quizzes.dart';

import '../Authentications/loginpage.dart';


class DrawerList extends StatefulWidget {
  const DrawerList({super.key});

  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFffeaad),
      height: MediaQuery.of(context).size.height * 0.793,
      child: Column(
        children: [
          const SizedBox(height: 24),
          const Divider(thickness: 2, height: 2, color: Color(0xFF1c2130)),
          element("Home", const HomePage(), context),
          //element("My Scores", const Scores(), context),
          element("Created Quizzes", const CreateQuiz(), context),
          element("More Quizzes", const MoreQuizzes(), context),
          const Divider(
            thickness: 2,
            height: 2,
            color: Color(0xFF1c2130),
          ),
          const SizedBox(height: 150),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  logout(context);
                },
                child: const Text(
                  "Log out",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black),
                ),
              ),
              const Icon(Icons.logout_sharp),
            ],
          )
        ],
      ),
    );
  }

  void logout(BuildContext context) async {
    try {
      await auth.signOut();

      // ignore: use_build_context_synchronously
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()));
    } catch (e) {}
  }
}

Widget element(tabname, page, context) {
  return Column(
    children: [
      // const SizedBox(height: 5),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.081,
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFffeaad),
          ),
          child: Text(
            tabname,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
        ),
      ),
      // const SizedBox(height: 5),
      /*const Divider(
        thickness: 2,
        height: 2,
        color: Color(0xFF1c2130),
      ),*/
    ],
  );
}
