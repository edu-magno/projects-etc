import 'dart:async';

class Validators {
  //<String, String> is the type of que data Tranformer receive and the return fo transform
  final emailValidator = new StreamTransformer<String, String>.fromHandlers(
    handleData: (String email, dynamic sink) {
      if (email.contains('@')) {
        sink.add(email);
      } else {
        sink.addError('Enter a valid email.');
      }
    },
  );

  final passwordValidator = new StreamTransformer<String, String>.fromHandlers(
      handleData: (String password, EventSink sink) {
    if (password.length > 4) {
      sink.add(password);
    } else {
      sink.addError('Invalid password.');
    }
  });
}