import 'package:flutter/material.dart';

import '../../../Model/button_model.dart';
import '../../../Model/quizz_model.dart';
import '../../../Screens/HomePage/home.dart';
import '../../../Screens/HomePage/welcome.dart';
import 'Questions/animal_questions.dart';
import 'Questions/art_questions.dart';
import 'Questions/mythology_questions.dart';
import 'Questions/religion_questions.dart';


class Knowleadge extends StatefulWidget {
  const Knowleadge({super.key});

  @override
  State<Knowleadge> createState() => _KnowleadgeState();
}

class _KnowleadgeState extends State<Knowleadge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("General Knowledge Quiz"),
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
            Button(page: Quizz(list: artQuestions), text: "Art Quiz"),
            const SizedBox(height: 25),
            Button(
                page: Quizz(list: mythologyQuestions), text: "Mythology Quiz"),
            const SizedBox(height: 25),
            Button(
                page: Quizz(list: religionsQuestions), text: "Religion Quiz"),
            const SizedBox(height: 25),
            Button(
                page: Quizz(list: animalsAndWildlifeQuestions),
                text: "Animals/Wildlife Quiz"),
            const SizedBox(height: 25),
            const Text("---------------------OR---------------------"),
            const Text("Create Your Own Quiz"),
            const SizedBox(height: 25),
            const Button(page: HomePage(), text: "Create Your Own Quiz")
          ],
        ),
      ),
    );
  }
}
