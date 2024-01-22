import 'package:flutter/material.dart';
import 'package:quizzy/Model/button_model.dart';
import '../../../Model/quizz_model.dart';
import '../../../Screens/HomePage/welcome.dart';
import '../Science/science.dart';
import 'Questions/geography2_questions.dart';
import 'Questions/geography_questions.dart';
import 'Questions/history2_questions.dart';
import 'Questions/history_questions.dart';


class GeoHist extends StatefulWidget {
  const GeoHist({super.key});

  @override
  State<GeoHist> createState() => _GeoHistState();
}

class _GeoHistState extends State<GeoHist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("Geogrophy/History Quiz"),
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
            Button(page: Quizz(list: historyQuestions), text: "History Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: geographyQuestions), text: "Geo Quiz"),
            const SizedBox(height: 25),
            Button(
                page: Quizz(list: history2Questions), text: "History 2 Quiz"),
            const SizedBox(height: 25),
            Button(page: Quizz(list: Geography2Questions), text: "Geo 2 Quiz"),
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
