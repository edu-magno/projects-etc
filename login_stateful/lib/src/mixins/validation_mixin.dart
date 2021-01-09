class ValidationMixin {
  String validateEmail (String value) {
          final regex = RegExp(
              r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

          if (!regex.hasMatch(value)) {
            return 'please enter a valid email';
          }
          return null;
        }
  String validatePassword(String value) {
    final regex =
        RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

    if (!regex.hasMatch(value)) {
      return 'Password must contain minimum 8 caracters, 1 symbol, 1 uppercase, 1 lowercase and 1 number.';
    }

    return null;
  }
}
