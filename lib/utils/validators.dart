bool isValidEmail(String email) {
  final emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
  return emailRegex.hasMatch(email);
}

bool isValidPasswordComplex(String password) {
  final hasUppercase = password.contains(RegExp(r'[A-Z]'));
  final hasDigits = password.contains(RegExp(r'[0-9]'));
  final hasSpecialCharacters = password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  final hasMinLength = password.length >= 8;

  return hasUppercase && hasDigits && hasSpecialCharacters && hasMinLength;
}

String? getPasswordError(String password) {
  if (password.isEmpty) {
    return 'Password cannot be empty.';
  } else if (password.length < 8) {
    return 'Password must be at least 8 characters.';
  } else if (!password.contains(RegExp(r'[A-Z]'))) {
    return 'Password must include an uppercase letter.';
  } else if (!password.contains(RegExp(r'[0-9]'))) {
    return 'Password must include a number.';
  } else if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
    return 'Password must include a special character.';
  }
  return null;
}

bool arePasswordsMatching(String password, String confirmPassword) {
  return password == confirmPassword;
}
