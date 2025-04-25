import 'package:example/appbars/header.dart';
import 'package:example/chips_toggles/chips.dart';
import 'package:example/chips_toggles/toggles.dart';
import 'package:example/containers/form_container.dart';
import 'package:example/editors/quill_editor.dart';
import 'package:example/icons/circular_icon.dart';
import 'package:example/table/paginated_datatable.dart';
import 'package:example/table/table.dart';
import 'package:example/table/table_header.dart';
import 'package:flutter/material.dart';
import 'package:t_utils/t_utils.dart';

import 'appbars/appbar.dart';
import 'appbars/sliver_appbar.dart';
import 'breadcrumbs/breadcrumbs.dart';
import 'containers/rounded_container.dart';
import 'dropdowns/dropdown.dart';

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
      theme: ThemeData(scaffoldBackgroundColor: TColors().lightBackground),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes().defaultSpace * 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Text('Header', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CustomHeaderExampleScreen()),
                ),
                child: Text('Custom Header'),
              ),

              /// Appbars
              Text('Appbar\'s', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CustomAppBarExampleScreen()),
                ),
                child: Text('Custom Appbar'),
              ),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => TSliverAppBarExample()),
                ),
                child: Text('Sliver Appbar'),
              ),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Editor
              Text('Editor', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TTextEditorExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// TAnimation Widget
              TAnimationLoader(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Dropdown
              Text('Dropdown', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TDropdownExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Breadcrumbs with Heading
              Text('Breadcrumbs with Heading', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TBreadcrumbWithHeading(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Icons
              Text('Icons', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TCircularIconExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Toggle Switches
              Text('Toggle Switches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TTogglesExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Chips
              Text('Chips and Toggle Switches', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TChipsExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Rounded Container
              Text('Rounded Container', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TRoundedContainerExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Form Container
              Text('Form Container', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TFormContainerExample(),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),

              /// Table Header
              Text('Table Header', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              TTableHeaderExample(),
              SizedBox(height: 16),

              /// Table
              Text('Table', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TDataTableExample())),
                child: Text('Data Table with Load More'),
              ),
              SizedBox(height: 16),

              /// Paginated Table
              Text('Paginated Table', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TPaginatedDataTableExample())),
                child: Text('Data Table with Load More'),
              ),

              SizedBox(height: 12),
              Divider(),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
