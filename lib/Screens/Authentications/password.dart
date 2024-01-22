import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

Future<void> resetpass(BuildContext context) {
  TextEditingController email = TextEditingController();
  double w = MediaQuery.of(context).size.width;
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        backgroundColor: const Color(0xFFffeaad),
        content: SingleChildScrollView(
          child: Container(
            width: w * 0.6,
            padding: const EdgeInsets.all(8.0),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text(
                "Enter Your Email And We Will Wend You A Password Reset Link",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              TextFormField(
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
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(23))),
                onPressed: () async {
                  reset(context, email);
                },
                child: const Text("reset password"),
              ),
            ]),
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Done',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}

reset(context, email) {
  try {
    FirebaseAuth.instance.sendPasswordResetEmail(email: email.text.trim());

    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('password link has been sent! check mail'),
          );
        });
  } on FirebaseAuthException catch (e) {
    showDialog(
        context: context,
        builder: (context) {
          return Text(e.message.toString());
        });
  }
}
