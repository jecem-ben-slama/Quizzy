import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/Tools/Animations/custom_animation.dart';
import '../HomePage/home.dart';
import 'loginpage.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  bool isSecure = true;
  bool isSecure1 = true;
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController passwordd = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xFF1c2130),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //INPUTS
            Expanded(
              child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      color: Color(0xFFffeaad),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                          bottomRight: Radius.circular(40))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(height: 35),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 25),
                          child: Form(
                            key: formKey,
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(height: 30),

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
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
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
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  //PASSWORD 2
                                  const Text(
                                    'Password',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24),
                                    textAlign: TextAlign.start,
                                  ),
                                  TextFormField(
                                    controller: passwordd,
                                    obscureText: isSecure1,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'please fill this field';
                                      } else if (value.length < 8) {
                                        return 'password must be longuer than 8 digits';
                                      } else if (passwordd.text !=
                                          password.text) {
                                        return 'password not similar';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      suffixIcon: toggle1(),
                                      label: const Text("Confirm Password"),
                                      hintText: null,
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                        color: Colors.black,
                                      )),
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 25),
                                  //LOGIN BTN
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          signin();
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
                                        'create account',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  account(context),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ),
            //WELCOME TEXT
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: welcometext(),
            ),
          ],
        ),
      ),
    );
  }

  signin() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.text, password: password.text)
        .then((value) {
      //fire succesful

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Something Went Wrong')));
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

  Widget toggle1() {
    return IconButton(
      onPressed: () {
        setState(() {
          isSecure1 = !isSecure1;
        });
      },
      icon: isSecure1
          ? const Icon(Icons.visibility_off)
          : const Icon(Icons.visibility),
      color: Colors.black,
    );
  }
}

Widget welcometext() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Signin",
        style: TextStyle(color: Colors.white, fontSize: 40),
      ),
      Text(
        "join our family",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ],
  );
}

Widget account(context) {
  return Center(
    child: Column(
      children: [
        const Text("---------------------OR---------------------"),
        const Text("if you already have an account"),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    CustomPageRoute(
                      child: const LoginPage(),
                      direction: AxisDirection.down,
                    ),
                  );
                },
                child: const Text(
                  "login",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ))
          ],
        ),
      ],
    ),
  );
}
