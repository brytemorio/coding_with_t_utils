/// Custom exception class to handle various format-related errors.
class TFormatException implements Exception {
  /// The associated error message.
  final String exception;

  /// Default constructor with a generic error message.
  const TFormatException([this.exception = 'An unexpected format error occurred. Please check your input.']);

  /// Create a format exception from a specific error message.
  factory TFormatException.fromMessage(String message) {
    return TFormatException(message);
  }

  /// Get the corresponding error message.
  String get formattedMessage => exception;

  /// Create a format exception from a specific error code.
  String message(String code) {
    switch (code) {
      case 'invalid-email-format':
        return 'The email address format is invalid. Please enter a valid email.';
      case 'invalid-phone-number-format':
        return 'The provided phone number format is invalid. Please enter a valid number.';
      case 'invalid-date-format':
        return 'The date format is invalid. Please enter a valid date.';
      case 'invalid-url-format':
        return 'The URL format is invalid. Please enter a valid URL.';
      case 'invalid-credit-card-format':
        return 'The credit card format is invalid. Please enter a valid credit card number.';
      case 'invalid-numeric-format':
        return 'The input should be a valid numeric format.';
    // Add more cases as needed...
      default:
        return code;
    }
  }
}