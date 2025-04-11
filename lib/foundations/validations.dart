
import '../core/utils/strings/app_string.dart';

enum ValidationType{
  none,
  email,
  text,
  phone,
  password,
  confirmPassword,
  birthDate,
  name,
  fullName,
  verificationCode,

}

bool isValidBirthdate(DateTime birthdate) {
  DateTime currentDate = DateTime.now();
  DateTime minBirthdate = currentDate.subtract(const Duration(days: 365 * 100));
  DateTime maxBirthdate = currentDate;

  // Check if the birthdate is within the valid range
  return birthdate.isAfter(minBirthdate) && birthdate.isBefore(maxBirthdate);
}

bool isContainSpecialCharacters(String input) {
  for (int i = 0; i < input.length; ++i) {
    int ascii = input.codeUnitAt(i);

    // Allow Arabic (0x0600-0x06FF, 0x0750-0x077F, 0x08A0-0x08FF)
    // Allow English uppercase (65-90), lowercase (97-122), and space (32)
    if (!((ascii >= 65 && ascii <= 90) ||
        (ascii >= 97 && ascii <= 122) ||
        ascii == 32 ||
        (ascii >= 0x0600 && ascii <= 0x06FF) ||
        (ascii >= 0x0750 && ascii <= 0x077F) ||
        (ascii >= 0x08A0 && ascii <= 0x08FF))) {
      return true; // Contains a special character
    }
  }
  return false; // No special characters found
}

bool isContainNumbers(String input) {
  for (int i = 0, len = input.length; i < len; ++i) {
    int ascii = input.codeUnitAt(i);
    // range (48 - 57) for digits from 0 to 9
    if ((ascii >= 48 && ascii <= 57)) return true;
  }
  return false;
}
bool isValidFullName(String fullName) {
  // Regular expression to allow only letters (English & Arabic) and exactly one space between first & last name
  RegExp regex = RegExp(r'^[a-zA-Z\u0600-\u06FF]+ [a-zA-Z\u0600-\u06FF]+$');
  return regex.hasMatch(fullName);
}

RegExp emailRegex = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
);

String? isRequired(String val, String fieldName) {
  if (val.trim().isEmpty) {  // Trim spaces to prevent false positives
    return '${AppStrings.pleaseEnter} $fieldName.';
  }
  return null;
}

RegExp regexPhone = RegExp(r'^(010|011|012|015)\d{8}$');
bool isPhone(String phoneNumber) {
  if (regexPhone.hasMatch(phoneNumber.toString())) {
    return true;
  } else {
    return false;
  }
}

String? checkPassword(String val) {
  if (val.length < 6) {
    return AppStrings.passwordLenghtError;
  }

  // if (!RegExp(r'[A-Z]').hasMatch(val)) {
  //   return AppStrings.passwordMustContainAtLeastOneLowercaseLetter;
  // }

  if (!RegExp(r'[a-z]').hasMatch(val)) {
    return AppStrings.passwordMustContainAtLeastOneUpperCaseLetter;
  }

  if (!RegExp(r'[0-9]').hasMatch(val)) {
    return AppStrings.passwordMustContainAtLeastOneDigit;
  }

  if (!RegExp(r'[!@#\$&*~]').hasMatch(val)) {
    return AppStrings.passwordMustContainAtLeastOneSpecialCharacter;
  }

  return null;
}




bool isValidNationalNumber(String val) {
  // Example: Validate if the number is 10-14 digits long
  final nationalNumberRegex = RegExp(r'^\d{14}$');

  // Validate based on custom rules
  if (!nationalNumberRegex.hasMatch(val)) {
    return false;
  }

  return true;
}

String? checkFieldValidation(
    {required String? val,
    required String fieldName,
    required ValidationType fieldType,
    String? confirmPass}) {
  String? errorMsg;

  if (fieldType == ValidationType.text) {
    errorMsg = isRequired(val!, fieldName);
  }
  // if (fieldType == ValidationType.banckAccountNumber) {
  //   if (isRequired(val!, fieldName) != null) {
  //     errorMsg = isRequired(val, fieldName);
  //   } else if (!isValidBankAccountNumber(val)) {
  //     errorMsg =
  //         AppStrings.bankAccountNumberError; // Add appropriate error message
  //   }
  // }
  // if (fieldType == ValidationType.nationalIDOrPhone) {
  //   if (isRequired(val!, fieldName) != null) {
  //     errorMsg = isRequired(val, fieldName);
  //   } else {
  //     // Check the first three digits
  //     if (val.length >= 3) {
  //       String prefix = val.substring(0, 3);
  //       if (['011', '010', '012', '015'].contains(prefix)) {
  //         // Validate as a phone number
  //         if (!regexPhone.hasMatch(val)) {
  //           errorMsg = AppStrings.phoneError;
  //         }
  //       } else {
  //         // Validate as a national ID
  //         if (!isValidNationalNumber(val)) {
  //           errorMsg = AppStrings.nationalNumberError;
  //         }
  //       }
  //     } else {
  //       errorMsg = AppStrings.invalidInput;
  //     }
  //   }
  // }

  if (fieldType == ValidationType.name) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    }
  }


  if (fieldType == ValidationType.fullName) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (isContainNumbers(val)) {
      errorMsg = AppStrings.nameMustNotContainNumbers;
    }else if (!isValidFullName(val)){
      errorMsg = AppStrings.fullNameMustContainOneSpace;
    } else if (isContainSpecialCharacters(val)) {
      errorMsg = AppStrings.nameMustNotContainSpecialCharacters;
    }
  }

  if (fieldType == ValidationType.birthDate) {
    // must be in form YYYY-MM-DD.
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    }
    String input = val;
    DateTime? parsedDate = DateTime.tryParse(input);
    if (parsedDate == null) {
      print("input : $input");
      errorMsg = AppStrings.dateError;
    } else {
      // check it's in a range
      // if (!isValidBirthdate(parsedDate)) {
      //   errorMsg = AppStrings.birthDateError;
      // }
    }
  }

  if (fieldType == ValidationType.verificationCode) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!RegExp(r'^\d{4}$').hasMatch(val)) {
      errorMsg = AppStrings.verificationCodeError;
    }
  }

  if (fieldType == ValidationType.email) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (!emailRegex.hasMatch(val)) {
      errorMsg = AppStrings.invalidEmail;
    }
  }

  // if (fieldType == ValidationType.nationalNumber) {
  //   if (isRequired(val!, fieldName) != null) {
  //     errorMsg = isRequired(val, fieldName);
  //   } else if (!isValidNationalNumber(val)) {
  //     errorMsg = AppStrings.nationalNumberError;
  //   }
  // }

  // if (fieldType == ValidationType.emailAndPhone) {
  //   if (isRequired(val!, fieldName) != null) {
  //     errorMsg = isRequired(val, fieldName);
  //   } else if (num.tryParse(val) is num) {
  //     if (val.length != 11) {
  //       errorMsg = AppStrings.phoneError;
  //     } else if (!regexPhone.hasMatch(val)) {
  //       errorMsg = AppStrings.phoneNotMatch;
  //     }
  //   } else if (!emailRegex.hasMatch(val)) {
  //     errorMsg = AppStrings.emailError;
  //   }
  // }

  if (fieldType == ValidationType.password) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPassword(val) != null) {
      errorMsg = checkPassword(val);
    }
  }

  if (fieldType == ValidationType.confirmPassword) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (checkPassword(val) != null) {
      errorMsg = checkPassword(val);
    } else if (val != confirmPass) {
      errorMsg = AppStrings.confirmPasswordNotMatch;
    }
  }

  // if (fieldType == ValidationType.price) {
  //   if (isRequired(val!, fieldName) != null) {
  //     errorMsg = isRequired(val, fieldName);
  //   }
  //   if (double.tryParse(val) == null) {
  //     errorMsg = AppStrings.priceError;
  //   }
  //   if (double.parse(val) < 0) {
  //     errorMsg = AppStrings.priceError;
  //   }
  // }

  if (fieldType == ValidationType.phone) {
    if (isRequired(val!, fieldName) != null) {
      errorMsg = isRequired(val, fieldName);
    } else if (val.length < 11) {
      errorMsg = AppStrings.phoneNumberMustBe11Digits;
    } else if (val.length > 11) {
      errorMsg = AppStrings.phoneNumberMustBe11Digits;
    } else if (!regexPhone.hasMatch(val)) {
      errorMsg = AppStrings.invalidPhoneNumber;
    }
  }


  return (errorMsg != null) ? errorMsg : null;
}