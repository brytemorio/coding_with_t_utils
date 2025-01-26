import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../constants/enums.dart';

/// A utility class containing helper functions for various common tasks.
class THelperFunctions {
  /// Returns the start of the week (Monday) for a given [date].
  /// The returned DateTime is at 00:00:00 (midnight).
  static DateTime getStartOfWeek(DateTime date) {
    final int daysUntilMonday = date.weekday - 1;
    final DateTime startOfWeek = date.subtract(Duration(days: daysUntilMonday));
    return DateTime(
        startOfWeek.year, startOfWeek.month, startOfWeek.day, 0, 0, 0, 0, 0);
  }

  /// Convert a [Color] to its 32-bit ARGB integer value.
  static int computeColorValue(Color color) {
    final a = (color.a * 255).round(); // Convert alpha to 0-255
    final r = (color.r * 255).round(); // Convert red to 0-255
    final g = (color.g * 255).round(); // Convert green to 0-255
    final b = (color.b * 255).round(); // Convert blue to 0-255

    // Combine ARGB into a single 32-bit integer
    final intValue = (a << 24) | (r << 16) | (g << 8) | b;
    return intValue;
  }

  /// Restore a [Color] from a 32-bit ARGB integer value.
  static Color restoreColorFromValue(String value) {
    final intValue = int.tryParse(value) ?? 0;
    final a = (intValue >> 24) & 0xFF; // Extract alpha
    final r = (intValue >> 16) & 0xFF; // Extract red
    final g = (intValue >> 8) & 0xFF; // Extract green
    final b = intValue & 0xFF; // Extract blue

    // Create the color with values in the 0-255 range and alpha in 0-255.
    return Color.fromARGB(a, r, g, b);
  }

  /// Returns a color based on the [VerificationStatus].
  static Color getVerificationStatusColor(VerificationStatus status) {
    switch (status) {
      case VerificationStatus.unknown:
        return Colors.grey;
      case VerificationStatus.pending:
        return Colors.orange;
      case VerificationStatus.submitted:
        return Colors.blue;
      case VerificationStatus.underReview:
        return Colors.yellow;
      case VerificationStatus.approved:
        return Colors.green;
      case VerificationStatus.rejected:
        return Colors.red;
    }
  }

  /// Returns a color based on the [OrderStatus].
  static Color getOrderStatusColor(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return Colors.grey;
      case OrderStatus.processing:
        return Colors.orange;
      case OrderStatus.shipped:
        return Colors.blue;
      case OrderStatus.delivered:
        return Colors.green;
      case OrderStatus.canceled:
        return Colors.red;
      case OrderStatus.returned:
        return Colors.brown;
      case OrderStatus.refunded:
        return Colors.teal;
    }
  }

  /// Returns a color based on the [PaymentStatus].
  static Color getPaymentStatusColor(PaymentStatus status) {
    switch (status) {
      case PaymentStatus.unpaid:
        return Colors.grey;
      case PaymentStatus.refunded:
        return Colors.orange;
      case PaymentStatus.paid:
        return Colors.green;
      case PaymentStatus.failed:
        return Colors.red;
      case PaymentStatus.pendingRefund:
        return Colors.brown;
    }
  }

  /// Returns a color corresponding to the string [value].
  /// You can extend this list to include additional colors as needed.
  static Color? getColor(String value) {
    if (value == 'Green') {
      return Colors.green;
    } else if (value == 'Red') {
      return Colors.red;
    } else if (value == 'Blue') {
      return Colors.blue;
    } else if (value == 'Pink') {
      return Colors.pink;
    } else if (value == 'Grey') {
      return Colors.grey;
    } else if (value == 'Purple') {
      return Colors.purple;
    } else if (value == 'Black') {
      return Colors.black;
    } else if (value == 'White') {
      return Colors.white;
    } else if (value == 'Yellow') {
      return Colors.yellow;
    } else if (value == 'Orange') {
      return Colors.deepOrange;
    } else if (value == 'Brown') {
      return Colors.brown;
    } else if (value == 'Teal') {
      return Colors.teal;
    } else if (value == 'Indigo') {
      return Colors.indigo;
    } else {
      return null;
    }
  }

  /// Show a [SnackBar] with the given [message].
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  /// Show an alert dialog with a [title] and [message].
  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// Navigate to the [screen] passed as an argument.
  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => screen),
    );
  }

  /// Truncate a [text] to the specified [maxLength] and append '...' if it exceeds.
  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  /// Check if the current theme is dark mode.
  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  /// Get the size of the screen.
  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  /// Get the height of the screen.
  static double screenHeight() {
    return MediaQuery.of(Get.context!).size.height;
  }

  /// Get the width of the screen.
  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }

  /// Format a [DateTime] as a string with the specified [format] (default is 'dd MMM yyyy').
  static String getFormattedDate(DateTime date,
      {String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(date);
  }

  /// Remove duplicates from a list [list] and return a new list with unique items.
  static List<T> removeDuplicates<T>(List<T> list) {
    return list.toSet().toList();
  }

  /// Wrap widgets in rows based on the specified [rowSize].
  static List<Widget> wrapWidgets(List<Widget> widgets, int rowSize) {
    final wrappedList = <Widget>[];
    for (var i = 0; i < widgets.length; i += rowSize) {
      final rowChildren = widgets.sublist(
          i, i + rowSize > widgets.length ? widgets.length : i + rowSize);
      wrappedList.add(Row(children: rowChildren));
    }
    return wrappedList;
  }
}
