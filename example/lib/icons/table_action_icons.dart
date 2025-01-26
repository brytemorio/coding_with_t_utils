import 'package:flutter/material.dart';
import 'package:t_utils/t_utils.dart';

class TTableActionIconExample extends StatelessWidget {
  const TTableActionIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return TTableActionButtons(
      onViewPressed: () {
        print('View button pressed');
      },
      onEditPressed: () {
        print('Edit button pressed');
      },
      onDeletePressed: () {
        print('Delete button pressed');
      },
      iconSize: 30.0, // Custom icon size
      spacing: 12.0, // Custom spacing between buttons
      tooltipEnabled: true, // Enable tooltips
    );
  }
}
