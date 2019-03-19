import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:usage/app/appRoot.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (input) {
                if (input.isEmpty) {
                  return 'Please enter email';
                }
              },
              onSaved: (input) => _email = input,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextFormField(
              validator: (input) {
                if (input.length < 6) {
                  return 'Password must be at least 6 characters';
                }
              },
              onSaved: (input) => _password = input,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            RaisedButton(
              onPressed: () => signIn(context),
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.pop(
            context, MaterialPageRoute(builder: (context) => AppRoot()));
      } catch (e) {
        print(e.message);
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text("Error"),
                  content: Container(
                    height: 150,
                    child: Column(children: [
                      Text(e.message),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Close"),
                      )
                    ]),
                  ));
            });
      }
    }
  }
}
