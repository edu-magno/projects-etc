import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin{
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return MaterialApp(
      home: Container(
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              emailField(),
              passwordField(),
              Container(margin: EdgeInsets.only(top: 25.0)),
              submitButton(),
            ],
          ),
        ),
      ),
    );
  }

  emailField() => TextFormField(
        decoration:
            InputDecoration(labelText: 'E-mail', hintText: 'you@example.com'),
        keyboardType: TextInputType.emailAddress,
        // ignore: missing_return
        validator: (value) => validateEmail(value),
        onSaved: (String newValue) {
          email = newValue;
        },
      );
  passwordField() => TextFormField(
        decoration: InputDecoration(labelText: 'Password'),
        obscureText: true,
        // ignore: missing_return
        validator: validatePassword,
        onSaved: (String newValue) {
          password = newValue;
        },
      );
  submitButton() => RaisedButton(
        onPressed: () => {
          if (formKey.currentState.validate()) {
            formKey.currentState.save(),
            print('$email $password'),
          }
        },
        color: Colors.amber,
        textColor: Colors.white70,
        child: Text('Sign In'),
      );
}
