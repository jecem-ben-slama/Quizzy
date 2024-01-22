import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../Screens/HomePage/home.dart';
import '/Screens/Authentications/loginpage.dart';
class LoggedIN extends StatefulWidget {
  const LoggedIN({super.key});

  @override
  State<LoggedIN> createState() => _LoggedINState();
}

class _LoggedINState extends State<LoggedIN> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkAuthState(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        } else {
          
          return snapshot.data! ? const HomePage() : const LoginPage();
        }
      },
    );
  }

  Future<bool> checkAuthState() async {
    final User? user = _auth.currentUser;
    return user != null;
  }
}
