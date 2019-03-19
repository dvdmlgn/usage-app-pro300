import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:usage/components/auth/sign_in.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
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
              onPressed: () => signUp(context),
              child: Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signUp(BuildContext context) async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => SignIn()));
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
