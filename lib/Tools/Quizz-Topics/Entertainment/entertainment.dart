import 'package:flutter/material.dart';

import '../../../Model/button_model.dart';
import '../../../Model/quizz_model.dart';
import '../../../Screens/HomePage/home.dart';
import '../../../Screens/HomePage/welcome.dart';
import 'Questions/anime_questions.dart';
import 'Questions/cartoon_questions.dart';
import 'Questions/movie_questions.dart';
import 'Questions/series_questions.dart';


class Entertainment extends StatefulWidget {
  const Entertainment({super.key});

  @override
  State<Entertainment> createState() => _EntertainmentState();
}

class _EntertainmentState extends State<Entertainment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("Entertainment Quiz"),
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
            Button(page: Quizz(list: movieQuestions), text: "Movie Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: seriesQuestions), text: "Series Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: animeQuestions), text: "Anime Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: cartoonQuestions), text: "Cartoon Quiz"),
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
