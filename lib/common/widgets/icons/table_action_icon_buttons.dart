import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_utils/t_utils.dart';

class TTableActionButtons extends StatelessWidget {
  /// Widget for displaying action buttons for table rows
  const TTableActionButtons({
    super.key,
    this.view = false,
    this.edit = true,
    this.delete = true,
    this.onViewPressed,
    this.onEditPressed,
    this.onDeletePressed,
    this.iconSize = 24.0,
    this.spacing = 8.0,
    this.tooltipEnabled = true,
  });

  /// Flag to determine whether the view button is enabled
  final bool view;

  /// Flag to determine whether the edit button is enabled
  final bool edit;

  /// Flag to determine whether the delete button is enabled
  final bool delete;

  /// Callback function for when the view button is pressed
  final VoidCallback? onViewPressed;

  /// Callback function for when the edit button is pressed
  final VoidCallback? onEditPressed;

  /// Callback function for when the delete button is pressed
  final VoidCallback? onDeletePressed;

  /// Custom size for the icons
  final double iconSize;

  /// Custom spacing between the buttons
  final double spacing;

  /// Flag to enable/disable tooltips for the icons
  final bool tooltipEnabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TSizes().sm,
      children: [
        if (view)
          _buildIconButton(
            icon: Iconsax.document_text,
            color: Colors.grey,
            onPressed: onViewPressed,
            tooltip: tooltipEnabled ? 'View' : null,
          ),
        if (edit)
          _buildIconButton(
            icon: Iconsax.receipt_edit,
            color: Colors.blue,
            onPressed: onEditPressed,
            tooltip: tooltipEnabled ? 'Edit' : null,
          ),
        if (delete)
          _buildIconButton(
            icon: Iconsax.trash,
            color: Colors.red,
            onPressed: onDeletePressed,
            tooltip: tooltipEnabled ? 'Delete' : null,
          ),
      ],
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    VoidCallback? onPressed,
    String? tooltip,
  }) {
    return TIcon(icon: icon, onPressed: onPressed, color: color, tooltip: tooltip);
  }
}
