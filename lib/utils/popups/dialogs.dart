import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../common/widgets/texts/text_with_icon.dart';
import '../constants/colors.dart';

/// A class to manage and show dialogs with customizable actions.
class TDialogs {
  /// A default dialog with customizable title, content, buttons, and actions.
  ///
  /// - `context`: The `BuildContext` in which the dialog will be displayed.
  /// - `title`: The title of the dialog (default: 'Removal Confirmation').
  /// - `content`: The content widget to display inside the dialog. Defaults to a confirmation message.
  /// - `cancelText`: The text to display on the cancel button (default: 'Dismiss').
  /// - `confirmText`: The text to display on the confirm button (default: 'Remove').
  /// - `onCancel`: A callback function for the cancel button (optional). If not provided, the dialog will be dismissed.
  /// - `onConfirm`: A callback function for the confirm button (optional).
  /// - `hideActions`: A flag to hide action buttons (optional; default: false).
  /// - `canPop`: A flag to enable or disable dismissing the dialog by tapping outside (default: true).
  static defaultDialog({
    required BuildContext context,
    String title = 'Removal Confirmation', // Default title
    Widget? content, // Custom content for the dialog
    String cancelText = 'Dismiss', // Default cancel button text
    String confirmText = 'Remove', // Default confirm button text
    Function()? onCancel, // Custom cancel action
    Function()? onConfirm, // Custom confirm action
    bool hideActions = false, // Flag to hide buttons
    bool canPop = true, // Flag to control dismissing the dialog by tapping outside
  }) {
    showDialog(
      context: context,
      barrierDismissible: canPop,
      builder: (BuildContext context) {
        return PopScope(
          canPop: canPop,
          child: AlertDialog(
            backgroundColor: TColors.lightBackground,
            title: TTextWithIcon(text: title, icon: Iconsax.box),
            content: content ??
                Text(
                  'Removing this data will delete all related data. Are you sure?',
                  style: Theme.of(context).textTheme.bodyMedium, // Default text style
                ),
            actions: hideActions
                ? null
                : [
                    // Cancel button action, dismisses the dialog or runs custom action
                    OutlinedButton(
                      onPressed: onCancel ?? () => Navigator.of(context).pop(),
                      child: Text(cancelText),
                    ),
                    if (onConfirm != null)
                      // If onConfirm is provided, show the confirm button
                      ElevatedButton(
                        onPressed: onConfirm,
                        child: Text(confirmText),
                      ),
                  ],
          ),
        );
      },
    );
  }
}
