import 'package:flutter/material.dart';
import '../HomePage/home.dart';

class CreateQuiz extends StatefulWidget {
  const CreateQuiz({super.key});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  final question = TextEditingController();
  final correctoption = TextEditingController();
  final incorrect1 = TextEditingController();
  final incorrect2 = TextEditingController();
  final incorrect3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("Custom Quiz"),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            icon: const Icon(Icons.arrow_back_ios)),
      ),
      backgroundColor: const Color(0xFFffeaad),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 25),
            const Text(
              "Create Your Own Quiz ",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            const Divider(height: 2, thickness: 2, color: Colors.black),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              child: Column(
                children: [
                  const SizedBox(height: 8),
                  //Question
                  const Text(
                    "Write Your Question",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  handler(question, "Who Invented The Lightbulb"),
                  //Correct Answer
                  const SizedBox(height: 22),
                  const Text(
                    "Write The Correct Answer",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  handler(correctoption, "Thomas Edison"),
                  //Incorrect Answers
                  const SizedBox(height: 22),
                  const Text(
                    "And Please Provide Some Incorrect Options ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  handler(incorrect1, "Nicola Tesla"),
                  const SizedBox(height: 8),
                  handler(incorrect2, "Albert Einstein"),
                  const SizedBox(height: 8),
                  handler(incorrect3, "Ibn Khaldoun"),
                  const SizedBox(height: 8),
                ],
              ),
            ),
            const SizedBox(height: 20),
            button(),
          ],
        ),
      ),
    );
  }

  Widget button() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: const Color(0xFF1c2130),
        ),
        onPressed: () {
          const snackBar = SnackBar(
            content:
                Text('Quiz Created Succesfully', textAlign: TextAlign.center),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: const Text("Submit"),
      ),
    );
  }

  Widget handler(controllerr, text) {
    return TextFormField(
      controller: controllerr,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
          hintText: text,
          focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15))),
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF1c2130)))),
    );
  }
}
