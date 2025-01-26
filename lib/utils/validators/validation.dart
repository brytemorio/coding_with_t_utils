/// A class to handle various input validation checks for form fields.
class TValidator {
  /// Validates if the given text is empty.
  /// - `fieldName`: The name of the field being validated.
  /// - `value`: The value entered in the field.
  ///
  /// Returns a string error message if the field is empty, otherwise null.
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.'; // Return error message if the field is empty.
    }

    return null; // Return null if the field is not empty.
  }

  /// Validates the username input.
  /// - `username`: The username to be validated.
  ///
  /// Returns a string error message if the username is invalid, otherwise null.
  static String? validateUsername(String? username) {
    if (username == null || username.isEmpty) {
      return 'Username is required.'; // Return error message if username is empty.
    }

    // Define a regular expression pattern for the username.
    const pattern = r"^[a-zA-Z0-9_-]{3,20}$";

    // Create a RegExp instance from the pattern.
    final regex = RegExp(pattern);

    // Check if the username matches the pattern.
    bool isValid = regex.hasMatch(username);

    // Ensure the username doesn't start or end with an underscore or hyphen.
    if (isValid) {
      isValid = !username.startsWith('_') &&
          !username.startsWith('-') &&
          !username.endsWith('_') &&
          !username.endsWith('-');
    }

    if (!isValid) {
      return 'Username is not valid.'; // Return error message if the username is invalid.
    }

    return null; // Return null if the username is valid.
  }

  /// Validates the email input.
  /// - `value`: The email to be validated.
  ///
  /// Returns a string error message if the email is invalid, otherwise null.
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.'; // Return error message if email is empty.
    }

    // Regular expression for email validation
    final emailRegExp = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid email address.'; // Return error message if email doesn't match the pattern.
    }

    return null; // Return null if email is valid.
  }

  /// Validates the password input.
  /// - `value`: The password to be validated.
  ///
  /// Returns a string error message if the password is invalid, otherwise null.
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.'; // Return error message if password is empty.
    }

    // Check for minimum password length
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.'; // Return error message for short passwords.
    }

    // Check for uppercase letters
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.'; // Return error if no uppercase letter is found.
    }

    // Check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.'; // Return error if no number is found.
    }

    // Check for special characters
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character.'; // Return error if no special character is found.
    }

    return null; // Return null if password is valid.
  }

  /// Validates the phone number input.
  /// - `value`: The phone number to be validated.
  ///
  /// Returns a string error message if the phone number is invalid, otherwise null.
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.'; // Return error message if phone number is empty.
    }

    // Regular expression for phone number validation (assuming a 12-digit format)
    final phoneRegExp = RegExp(r'^\d{12}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (12 digits required).'; // Return error message if phone number is invalid.
    }

    return null; // Return null if phone number is valid.
  }

// Add more custom validators as needed for your specific requirements.
}
