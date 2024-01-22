import 'package:flutter/material.dart';

import '../../Model/api_quiz_model.dart';
import '../../Model/button_model.dart';
import '../Created-Quiz/create_quiz.dart';
import '../HomePage/welcome.dart';


class MoreQuizzes extends StatefulWidget {
  const MoreQuizzes({super.key});

  @override
  State<MoreQuizzes> createState() => _MoreQuizzesState();
}

class _MoreQuizzesState extends State<MoreQuizzes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("More Quizzes"),
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
            Button(
                page: ApiQuizzModel(
                    link:
                        "https://opentdb.com/api.php?amount=10&category=11&type=multiple"),
                text: "Entertainment Quiz"),
            const SizedBox(height: 25),
            Button(
                page: ApiQuizzModel(
                    link:
                        "https://opentdb.com/api.php?amount=10&category=24&difficulty=medium&type=multiple"),
                text: "Politics Quiz"),
            const SizedBox(height: 25),
            Button(
                page: ApiQuizzModel(
                    link:
                        "https://opentdb.com/api.php?amount=10&category=21&type=multiple"),
                text: " Sports Quiz"),
            const SizedBox(height: 25),
            Button(
                page: ApiQuizzModel(
                    link:
                        "https://opentdb.com/api.php?amount=10&category=28&type=multiple"),
                text: "Cars Quiz"),
            const SizedBox(height: 25),
            const Text("---------------------OR---------------------"),
            const Text("Create Your Own Quiz"),
            const SizedBox(height: 25),
            const Button(page: CreateQuiz(), text: "Create Your Own Quiz")
          ],
        ),
      ),
    );
  }
}
