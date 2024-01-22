import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Screens/HomePage/home.dart';

// ignore: must_be_immutable
class ApiQuizzModel extends StatefulWidget {
  ApiQuizzModel({required this.link, super.key});
  String link;

  @override
  State<ApiQuizzModel> createState() => _ApiQuizzModelState();
}

class _ApiQuizzModelState extends State<ApiQuizzModel> {
  var currentQuestionIndex = 0;
  Color trueColor = const Color(0xFF028f76);
  Color falseColor = const Color(0xFFd14334);
  late Future quiz;
  var isLoaded = false;
  var optionsList = [];
  PageController? controller = PageController(initialPage: 0);
  bool isPressed = false;

  Color btnColor = const Color(0xFFffeaad);
  int mainscore = 0;
  @override
  void initState() {
    super.initState();
    quiz = getQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1c2130),
        ),
        backgroundColor: const Color(0xFFffeaad),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: FutureBuilder(
              future: quiz,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  var data = snapshot.data["results"];

                  if (isLoaded == false) {
                    optionsList =
                        data[currentQuestionIndex]["incorrect_answers"];
                    optionsList
                        .add(data[currentQuestionIndex]["correct_answer"]);
                    optionsList.shuffle();
                    isLoaded = true;
                  }

                  return SizedBox(
                    width: 508.8,
                    height: 579.0,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 8),
                        /////////////
                        Expanded(
                          child: PageView.builder(
                            controller: controller!,
                            onPageChanged: (page) {
                              setState(() {
                                isPressed = false;
                              });
                            },
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              var answer =
                                  data[currentQuestionIndex]["correct_answer"];
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  //Question number
                                  Text(
                                    "Questions ${index + 1} /${data.length}",
                                    style: const TextStyle(
                                      color: Color(0xFF1c2130),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 28,
                                    ),
                                  ),
                                  const Divider(
                                      color: Colors.black,
                                      height: 8,
                                      thickness: 2),
                                  const SizedBox(height: 20),
                                  //Question
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 100,
                                    child: Center(
                                      child: Text(
                                        data[currentQuestionIndex]["question"]
                                            .toString(),
                                        style: const TextStyle(
                                          color: Color(0xFF1c2130),
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  //Options
                                  for (int i = 0; i < optionsList.length; i++)
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isPressed = true;
                                        });
                                        if (answer ==
                                            optionsList[i].toString()) {
                                          mainscore += 10;
                                        } else {
                                          setState(() {
                                            btnColor = Colors.red;
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: isPressed
                                              ? answer ==
                                                      optionsList[i].toString()
                                                  ? trueColor
                                                  : falseColor
                                              : Colors.blueGrey,
                                          borderRadius: const BorderRadius.all(
                                              Radius.circular(25)),
                                        ),
                                        width: double.infinity,
                                        height: 35,
                                        margin:
                                            const EdgeInsets.only(bottom: 18),
                                        child: Center(
                                          child: Text(
                                            optionsList[i],
                                            style: const TextStyle(
                                                color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ),
                                  const SizedBox(height: 30),
                                  OutlinedButton(
                                    onPressed: isPressed
                                        ? index + 1 == data.length
                                            ? () {
                                                dialog(context, mainscore);
                                              }
                                            : () {
                                                isLoaded = false;
                                                currentQuestionIndex++;
                                                controller!.nextPage(
                                                    duration: const Duration(
                                                        milliseconds: 15),
                                                    curve: Curves.linear);
                                              }
                                        : null,
                                    style: const ButtonStyle(),
                                    child: Text(
                                      index + 1 == data.length
                                          ? "See Result"
                                          : "Next Question ",
                                      style: const TextStyle(
                                        color: Color(0xFF1c2130),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      "Fetching Data",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  );
                }
              }),
        ));
  }

  getQuiz() async {
    var res = await http.get(Uri.parse(widget.link));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body.toString());

      return data;
    }
  }

  Future<void> dialog(BuildContext context, score) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: const Color(0xFF1c2130),
          content: SingleChildScrollView(
            child: Column(
              children: [
                result(score),
                const SizedBox(height: 10),
                const Text(
                  'Your Score Is : ',
                  style: TextStyle(
                    color: Color(0xFFffeaad),
                    fontSize: 19,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "$score/100",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color(0xffdafffb),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                backHome(context),
              ],
            ),
          ),
        );
      },
    );
  }

  result(score) {
    if (score > 0 && score < 30) {
      const Text(
        'Better Luck Next Time ',
        style: TextStyle(
          color: Color(0xFFffeaad),
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
    } else if (score > 30 && score < 60) {
      return const Text(
        'Not Bad, But You Can Do Better ',
        style: TextStyle(
          color: Color(0xFFffeaad),
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
    } else if (score > 60 && score < 100) {
      return const Text(
        'Congratulations ',
        style: TextStyle(
          color: Color(0xFFffeaad),
          fontSize: 25,
        ),
        textAlign: TextAlign.center,
      );
    }
  }

  Widget backHome(context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const HomePage()));
        },
        child: const Text(
          'done',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFFffeaad),
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
