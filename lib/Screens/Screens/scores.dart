import 'package:flutter/material.dart';
import '../Drawer/drawer_header.dart';
import '../Drawer/drawer_list.dart';
import 'score_list.dart';

class Scores extends StatefulWidget {
  const Scores({super.key});

  @override
  State<Scores> createState() => _ScoresState();
}

class _ScoresState extends State<Scores> {
  List<ScoreList> scoress = List.empty(growable: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "My Scores",
          style: TextStyle(fontSize: 25),
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF1c2130),
      ),
      backgroundColor: const Color(0xFFffeaad),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
                itemCount: scoress.length,
                itemBuilder: (context, index) => getRow(index)),
          ),
        ],
      ),
      drawer: drawer(),
    );
  }

  Widget getRow(int index) {
    return ListTile(
      title: Column(
        children: [
          Text(scoress[index].score.toString()),
        ],
      ),
    );
  }
}

Widget drawer() {
  return const Drawer(
    backgroundColor: Colors.amber,
    child: SingleChildScrollView(
      child: Column(
        children: [
          Header(),
          DrawerList(),
        ],
      ),
    ),
  );
}
