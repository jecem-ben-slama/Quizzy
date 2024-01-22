import 'package:flutter/material.dart';

import '../Screens/HomePage/home.dart';
import '../Screens/Screens/score_list.dart';

class Quizz extends StatefulWidget {
  const Quizz({required this.list, super.key});
  final List list;

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  List<ScoreList> scoress = List.empty(growable: true);

  Color trueColor = const Color(0xFF028f76);
  Color falseColor = const Color(0xFFd14334);
  Color btnColor = const Color(0xFFffeaad);
  int mainscore = 0;
  var isLoaded = false;
  var optionsList = [];
  PageController? controller = PageController(initialPage: 0);
  bool isPressed = false;

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
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller!,
          onPageChanged: (page) {
            setState(() {
              isPressed = false;
            });
          },
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            var answer = widget.list[index].correctAnswer;
            if (isPressed == false) {
              optionsList = widget.list[index].incorrectAnswer!;
              optionsList.add(widget.list[index].correctAnswer);
              optionsList.shuffle();
              isPressed = false;
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Question number
                  Text(
                    "Questions ${index + 1} /${widget.list.length}",
                    style: const TextStyle(
                      color: Color(0xFF1c2130),
                      fontWeight: FontWeight.w400,
                      fontSize: 28,
                    ),
                  ),
                  const Divider(color: Colors.black, height: 8, thickness: 2),
                  const SizedBox(height: 20),
                  //Question
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 100,
                    child: Text(
                      widget.list[index].question!,
                      style: const TextStyle(
                        color: Color(0xFF1c2130),
                        fontSize: 28,
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
                        if (answer == optionsList[i].toString()) {
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
                              ? answer == optionsList[i].toString()
                                  ? trueColor
                                  : falseColor
                              : Colors.blueGrey,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                        ),
                        width: double.infinity,
                        height: 35,
                        margin: const EdgeInsets.only(bottom: 18),
                        child: Center(
                          child: Text(
                            optionsList[i],
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  const SizedBox(height: 30),
                  //Next
                  OutlinedButton(
                    onPressed: isPressed
                        ? index + 1 == widget.list.length
                            ? () {
                                dialog(context, mainscore);
                              }
                            : () {
                                controller!.nextPage(
                                    duration: const Duration(milliseconds: 1),
                                    curve: Curves.linear);
                                setState(() {
                                  isPressed = false;
                                });
                              }
                        : null,
                    style: const ButtonStyle(),
                    child: Text(
                      index + 1 == widget.list.length
                          ? "See Result"
                          : "Next Question ",
                      style: const TextStyle(
                        color: Color(0xFF1c2130),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
      return const Text(
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
          setState(() {
            scoress.add(ScoreList(score: mainscore));
          });

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
