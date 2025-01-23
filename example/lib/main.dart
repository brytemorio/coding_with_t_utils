import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/chips/animated_icon_switch.dart';
import 'package:t_utils/common/widgets/chips/animated_switch.dart';
import 'package:t_utils/t_utils.dart';

import 'appbars/appbar.dart';
import 'appbars/sliver_appbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Utils Example',
      themeMode: ThemeMode.dark,
      theme: ThemeData(scaffoldBackgroundColor: TColors.lightBackground),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Appbars
            Text('Appbar\'s', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CustomAppBarExampleScreen())),
              child: Text('Custom Appbar'),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TSliverAppBarExample())),
              child: Text('Sliver Appbar'),
            ),

            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),

            // TabBar
            Text('Breadcrumbs with Heading', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TBreadcrumbsWithHeading(
              heading: 'Update Brand',
              homeTitle: const Text('Home'),
              subHeading: 'Edit details of the brand',
              homeOnTap: () {
                // Navigate to dashboard or home screen
                Navigator.pushNamed(context, '/home');
              },
              returnToPreviousScreen: true,
              breadcrumbItems: ['/categories', 'Update Brand'],
              breadcrumbItemsTextStyle: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
            SizedBox(height: 12),

            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),

            // TabBar
            Text('Icons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Row(
              children: [
                // Circular icon with default background and size
                TCircularIcon(
                  icon: Icons.home,
                  onPressed: () => debugPrint('Home icon pressed'),
                ),
                const SizedBox(width: 16.0),

                // Circular icon with custom background and icon size
                TCircularIcon(
                  size: 28.0,
                  icon: Icons.favorite,
                  color: Colors.pinkAccent,
                  onPressed: () => debugPrint('Favorite icon pressed'),
                ),
                const SizedBox(width: 16.0),

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
            ),

            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),

            // TabBar
            Text('Chips and Toggle Switches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
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
                  iconBuilder: (value) =>
                      value ? Icon(Icons.lightbulb, color: Colors.yellow) : Icon(Icons.lightbulb_outline, color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text('Toggle Switch with Icon', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            TIconToggleSwitch<int>(
              current: 1,
              options: [0, 1],
              icons: [Icons.light_mode, Icons.dark_mode],
              onChanged: (value) {
                print('Selected: $value');
              },
            ),

            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
