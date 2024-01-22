import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Tools/Animations/custom_animation.dart';
import '/Screens/Authentications/password.dart';
import '/Screens/Authentications/signinpage.dart';

import '../HomePage/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSecure = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF1c2130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //WELCOME TEXT
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: welcometext(),
            ),
            const SizedBox(height: 25),
            //INPUTS
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFFffeaad),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Form(
                            key: formKey,
                            child: Column(
                              children: [
                                ///EMAIL
                                const Text(
                                  'Email',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  textAlign: TextAlign.start,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: email,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                            .hasMatch(value)) {
                                      return 'please enter a valid email';
                                    } else if (value.isEmpty) {
                                      return 'please fill this field';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: null,
                                    label: const Text("Enter Email"),
                                    hintText: "email@exapmle.com",
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 30),
                                //PASSWORD
                                const Text(
                                  'Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                  textAlign: TextAlign.start,
                                ),
                                TextFormField(
                                  controller: password,
                                  obscureText: isSecure,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'please fill this field';
                                    } else if (value.length < 8) {
                                      return 'password must be longuer than 8 digits';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: toggle(),
                                    label: const Text("Enter Password"),
                                    hintText: null,
                                    focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                      color: Colors.black,
                                    )),
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                //FORGOT PASS
                                forgot(context),
                                const SizedBox(height: 8),
                                //LOGIN BTN
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      if (formKey.currentState!.validate()) {
                                        login();
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        elevation: 5,
                                        backgroundColor:
                                            const Color(0xFF1c2130),
                                        padding: const EdgeInsets.all(15),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        )),
                                    child: const Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                //SOCIALS
                                icons(),
                                const SizedBox(height: 8),
                                //CREATE ACCOUNT
                                create(context),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email.text, password: password.text)
        .then((value) {
      //fire succesful

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email Or Password Is Incorrect !')));
    });
  }

  Widget toggle() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure = !isSecure;
        });
      },
      icon: isSecure
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.black,
    );
  }
}

Widget icons() {
  return Center(
    child: Column(
      children: [
        const Text("---------------------OR---------------------"),
        const Text("Sign-up using the following methods"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                onPressed: () {}, icon: Image.asset("assets/google.png")),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/facebook.png')),
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/twitter.png')),
          ],
        ),
      ],
    ),
  );
}

Widget create(context) {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account ?"),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(
              CustomPageRoute(
                child: const SigninPage(),
                direction: AxisDirection.up,
              ),
            );
          },
          child: const Text(
            'Create',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ),
  );
}

Widget forgot(context) {
  return Row(
    children: [
      Expanded(
        child: Container(),
      ),
      TextButton(
        onPressed: () {
          resetpass(context);
        },
        child: const Text(
          'Forgot Your Password ?',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    ],
  );
}

Widget welcometext() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "login",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
      Text(
        "Welcome back",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ],
  );
}
