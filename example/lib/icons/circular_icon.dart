import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/icons/t_icon.dart';
import 'package:t_utils/t_utils.dart';

class TCircularIconExample extends StatelessWidget {
  const TCircularIconExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 16.0,
      children: [
        // Circular icon with default background and size
        TIcon(
          icon: Icons.home,
          onPressed: () => debugPrint('Home icon pressed'),
        ),

        // Circular icon with custom background and icon size
        TIcon(
          size: 28.0,
          icon: Icons.favorite,
          color: Colors.pinkAccent,
          onPressed: () => debugPrint('Favorite icon pressed'),
        ),

        // Circular icon with larger container size
        TIcon(
          width: 64.0,
          height: 64.0,
          size: 32.0,
          color: Colors.blueAccent,
          icon: Icons.settings,
          onPressed: () {
            debugPrint('Settings icon pressed');
          },
        ),

        // Circular icon with larger container size
        TIcon(
          color: Colors.black,
          icon: Icons.sailing_sharp,
          borderRadius: TSizes().sm,
          backgroundColor: Colors.green,
          onPressed: () {
            debugPrint('Settings icon pressed');
          },
        ),
      ],
    );
  }
}
