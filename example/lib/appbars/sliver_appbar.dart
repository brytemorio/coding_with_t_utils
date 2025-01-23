import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/appbar/sliver_appbar.dart';

class TSliverAppBarExample extends StatelessWidget {
  const TSliverAppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          TSliverAppBar(
            title: Text('Sliver AppBar Example'),
            useTitleInFlexibleSpace: false,
            flexibleSpace: Placeholder(),
            titleStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            showBackArrow: true,
            expandedHeight: 400.0,
            floating: true,
            // Make the app bar float on scroll
            pinned: true,
            // App bar will not stay pinned when scrolled
            snap: true,
            // App bar will snap into position when scrolling up
            background: Image.asset('assets/food-app-ui.png', fit: BoxFit.cover),
            // Custom background image
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search), tooltip: 'Search')],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ListTile(
                  title: Text('Item #$index'),
                  subtitle: Text('Subtitle for item #$index'),
                );
              },
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
