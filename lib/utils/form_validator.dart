class FormValidator {
  static bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static bool isNotValidEmail(String email) {
    return !RegExp(r"^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,}$").hasMatch(email);
  }

  static bool isNotContainEightCharacters(String password) {
    return password.length < 8;
  }

  static bool isNotAlphaNumeric(String password) {
    final hasLetter = RegExp(r'[A-Za-z]').hasMatch(password);
    final hasNumber = RegExp(r'\d').hasMatch(password);
    return !(hasLetter && hasNumber);
  }

  static bool isPasswordNotMatch(String password, String confirmPassword) {
    return password != confirmPassword;
  }
}
