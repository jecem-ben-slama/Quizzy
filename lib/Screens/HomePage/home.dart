import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import '../../Model/button_model.dart';
import '../../Tools/Quizz-Topics/Entertainment/entertainment.dart';
import '../../Tools/Quizz-Topics/General-Knowledge/general_knowledge.dart';
import '../../Tools/Quizz-Topics/Geo-History/geo_hist.dart';
import '../../Tools/Quizz-Topics/Science/science.dart';
import '../Created-Quiz/create_quiz.dart';
import '../Drawer/drawer_header.dart';
import '../Drawer/drawer_list.dart';
import '../Screens/score_list.dart';
import 'welcome.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ScoreList> scoress = List.empty(growable: true);
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlert = false;
  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() {
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlert == false) {
          showSnack();
          setState(() => isAlert = true);
        }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1c2130),
        centerTitle: true,
        title: const Text("QUIZZ"),
        elevation: 0,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: const Color(0xFFffeaad),
        child: const Column(
          children: [
            SizedBox(height: 20),
            WelcomeText(),
            Divider(height: 50, thickness: 2, color: Colors.black),

            //Quiz Topics
            Button(page: Science(), text: "Sciences"),
            SizedBox(height: 25),
            Button(page: GeoHist(), text: "Geo/History"),
            SizedBox(height: 25),
            Button(page: Knowleadge(), text: "General Knowledge"),
            SizedBox(height: 25),
            Button(page: Entertainment(), text: "Entertainment"),
            SizedBox(height: 25),
            Text("---------------------OR---------------------"),
            Text("Create Your Own Quiz"),
            SizedBox(height: 25),
            Button(page: CreateQuiz(), text: "Create Your Own Quiz")
          ],
        ),
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

  showSnack() {
    const snackBar = SnackBar(
      content: Text('No Internet Connection! Some Features Are Unavailable'),
      duration: Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
