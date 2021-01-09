import 'package:flutter/material.dart';
import '../blocs/bloc.dart';
import '../blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  Widget build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: [
          emailField(bloc),
          passwordField(bloc),
          Container(margin: EdgeInsets.only(top: 25.0)),
          submitButton(bloc)
        ],
      ),
    );
  }

  Widget emailField(Bloc bloc) => StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                labelText: 'Email Adress', errorText: snapshot.error),
          ));

  Widget passwordField(Bloc bloc) => StreamBuilder(
        stream: bloc.password,
        builder: (context, snapshot) => TextField(
          onChanged: bloc.changePassword,
          decoration:
              InputDecoration(labelText: 'Password', errorText: snapshot.error),
          obscureText: true,
        ),
      );

  Widget submitButton(Bloc bloc) => StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) => ElevatedButton(
          onPressed: snapshot.hasData ? bloc.submit : null,
          child: Text('Sign In')));
}
