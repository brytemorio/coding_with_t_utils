import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/chips/animated_icon_switch.dart';
import 'package:t_utils/common/widgets/chips/animated_switch.dart';

class TTogglesExample extends StatelessWidget {
  const TTogglesExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8),
        Text('Toggle Switch with Text',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Row(
          children: [
            // Circular icon with default values
            TAnimatedToggleSwitch(
              current: false,
              onChanged: (value) => debugPrint('Toggled to: $value'),
            ),
            SizedBox(width: 12),

            // Circular icon with custom values
            TAnimatedToggleSwitch(
              current: true,
              onChanged: (value) => debugPrint('Toggled to: $value'),
              activeColor: Colors.blue,
              inactiveColor: Colors.red,
              spacing: 40.0,
              height: 50.0,
              borderWidth: 6.0,
              indicatorSize: const Size.fromWidth(30),
              backgroundColor: Colors.white,
              borderColor: Colors.black12,
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withValues(alpha: 0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
              textBuilder: (value) => Text(
                value ? 'On' : 'Off',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              iconBuilder: (value) => value
                  ? Icon(Icons.lightbulb, color: Colors.yellow)
                  : Icon(Icons.lightbulb_outline, color: Colors.grey),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text('Toggle Switch with Icon',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 8),
        TIconToggleSwitch<int>(
          current: 1,
          options: [0, 1],
          icons: [Icons.light_mode, Icons.dark_mode],
          onChanged: (value) {
            print('Selected: $value');
          },
        ),
      ],
    );
  }
}
