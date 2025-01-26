import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/appbar/appbar.dart';
import 'package:t_utils/utils/constants/colors.dart';

/// Example screen demonstrating the usage of [TAppBar].
class CustomAppBarExampleScreen extends StatelessWidget {
  const CustomAppBarExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        // Custom title
        title: Text('Custom AppBar Example'),
        titleStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: TColors.textPrimary),

        // Enables the back arrow & when this is true, [leadingIcon & leadingOnPressed] will not work
        showBackArrow: true,

        // Optional: Custom leading icon
        leadingIcon: Icons.menu,

        // Handle leading icon action
        leadingOnPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Menu button pressed')));
        },

        // Action widgets on the right
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: TColors.iconPrimaryLight),
            onPressed: () {
              // Handle search action
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Search button pressed')));
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: TColors.iconPrimaryLight),
            onPressed: () {
              // Handle more options action
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('More button pressed')));
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'This is the body of the CustomAppBar example screen.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
