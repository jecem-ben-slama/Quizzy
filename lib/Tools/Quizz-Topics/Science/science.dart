import 'package:flutter/material.dart';

import '../../../Model/button_model.dart';
import '../../../Model/quizz_model.dart';
import '../../../Screens/HomePage/welcome.dart';
import 'Questions/chemistry_questions.dart';
import 'Questions/math_questions.dart';
import 'Questions/physics_questions.dart';
import 'Questions/science_question.dart';


class Science extends StatefulWidget {
  const Science({super.key});

  @override
  State<Science> createState() => _ScienceState();
}

class _ScienceState extends State<Science> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("Science Quiz"),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFFffeaad),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const WelcomeText(),
            const Divider(
              height: 50,
              thickness: 2,
              color: Colors.black,
            ),
            Button(page: Quizz(list: mathQuestions), text: "Math Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: scienceQuestions), text: "Science Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: physicsQuestions), text: "Physics Quiz"),
            const SizedBox(height: 25),
            Button(
                page: Quizz(list: chemistryQuestions), text: "Chemistry Quiz"),
            const SizedBox(height: 25),
            const Text("---------------------OR---------------------"),
            const Text("Create Your Own Quiz"),
            const SizedBox(height: 25),
            const Button(page: Science(), text: "Create Your Own Quiz")
          ],
        ),
      ),
    );
  }
}
