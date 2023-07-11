abstract class Regex {
  // email regex
  static final RegExp _emailRegExp = RegExp(
    r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$',
  );

  // minimum length 8 password
  static final RegExp _passwordRegExp = RegExp(
    r'^.{8,}$',
  );

  // validate email
  static bool isValidEmail(String email) {
    return _emailRegExp.hasMatch(email);
  }

  // validate password
  static bool isValidPassword(String password) {
    return _passwordRegExp.hasMatch(password);
  }
}
