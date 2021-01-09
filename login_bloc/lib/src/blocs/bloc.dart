import 'dart:async';
import 'package:rxdart/rxdart.dart';
import './validators.dart';

class Bloc extends Object with Validators {
  //create instance of email and password Controller
  // controolers must be privates (use undescore)
  final _email = BehaviorSubject<String>();

  final _password = BehaviorSubject<String>();

  // tranformers

  //set getters from email and password controllers

  Stream<String> get email => _email.stream.transform(emailValidator);
  Stream<String> get password => _password.stream.transform(passwordValidator);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(email, password, (e, p) => true);
  // Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  submit() {
    final validEmail = _email.value;
    final validPassowrd = _password.value;

    print('$validEmail $validPassowrd');
  }

  // cleanup controllers
  dispose() {
    _email.close();
    _password.close();
  }
}
