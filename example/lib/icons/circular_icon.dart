import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/icons/t_circular_icon.dart';

class TCircularIconExample extends StatelessWidget {
  const TCircularIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        // Circular icon with default background and size
        TCircularIcon(
          icon: Icons.home,
          onPressed: () => debugPrint('Home icon pressed'),
        ),

        // Circular icon with custom background and icon size
        TCircularIcon(
          size: 28.0,
          icon: Icons.favorite,
          color: Colors.pinkAccent,
          onPressed: () => debugPrint('Favorite icon pressed'),
        ),

        // Circular icon with larger container size
        TCircularIcon(
          width: 64.0,
          height: 64.0,
          size: 32.0,
          color: Colors.white,
          icon: Icons.settings,
          backgroundColor: Colors.blueAccent,
          onPressed: () {
            debugPrint('Settings icon pressed');
          },
        ),
      ],
    );
  }
}
