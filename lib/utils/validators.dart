import 'package:molix/utils/regex.dart';
import 'package:molix/utils/validation_messages.dart';

abstract class Validators {
  // email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.emailEmpty;
    } else if (!Regex.isValidEmail(value)) {
      return ValidationMessages.emailInvalid;
    } else {
      return null;
    }
  }

  // password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return ValidationMessages.passwordEmpty;
    } else if (!Regex.isValidPassword(value)) {
      return ValidationMessages.passwordInvalid;
    } else {
      return null;
    }
  }
}
