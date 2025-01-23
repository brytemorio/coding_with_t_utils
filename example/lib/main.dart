import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';
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
              breadcrumbItems: ['/home', '/categories', 'Update Brand'],
              breadcrumbItemsTextStyle: const TextStyle(fontSize: 14, color: Colors.blue),
            ),
            SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
