import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/provider.dart';
import './screens/login_screen.dart';

class App extends StatelessWidget {
  build(context) {
    return Provider(
      child: MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: LoginScreen(),
        ),
      ),
    );
  }
}
