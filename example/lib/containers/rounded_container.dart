import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/custom_shapes/containers/custom_container.dart';
import 'package:t_utils/t_utils.dart';

class TRoundedContainerExample extends StatelessWidget {
  const TRoundedContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        TContainer(
          child: Center(child: Text('Default')),
        ),
        TContainer(
          width: 100,
          height: 100,
          backgroundColor: Colors.blue,
          child: Center(child: Text('Simple')),
        ),
        TContainer(
          width: 150,
          height: 80,
          showBorder: true,
          borderColor: Colors.green,
          showShadow: true,
          child: Center(child: Text('Border & Shadow')),
        ),
        TContainer(
          width: 350,
          height: 100,
          alignment: Alignment.bottomCenter,
          shadow: BoxShadow(
            color: Colors.red.withValues(alpha: 0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
          child: Text('Custom Shadow with custom alignment'),
        ),
        TContainer(
          width: 120,
          height: 50,
          onTap: () {
            print('Tapped!');
          },
          showRipple: true,
          child: Center(child: Text('Clickable')),
        ),
      ],
    );
  }
}
