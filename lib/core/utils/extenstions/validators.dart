
class Validators {
  Validators._();
  static String? nameValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }
  static String? emailValidate(String? value){
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static final RegExp _phoneRegex = RegExp(r'^(01)[0-9]{9}$');

  static String? validatePhone(String? phoneNumber) {
    if (_phoneRegex.hasMatch(phoneNumber!)) {
      return null;
    } else {
      return 'Invalid Number';
    }
  }
  static String? passwordValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? confirmPasswordValidate(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}