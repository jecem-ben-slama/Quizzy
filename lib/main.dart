import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:page_transition/page_transition.dart';
import 'Tools/Firebase/firebase_options.dart';
import 'Tools/Firebase/loggedin_state.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: const Center(
          child: Text(
            "Quizzy",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        nextScreen: const LoggedIN(),
        duration: 1000,
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: const Color(0xFFffeaad),
      ),
    );
  }
}
