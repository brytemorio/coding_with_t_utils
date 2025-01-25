import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/custom_shapes/containers/form_container.dart';
import 'package:t_utils/common/widgets/exports.dart';

class TFormContainerExample extends StatelessWidget {
  const TFormContainerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        TFormContainer(
          isLoading: false,
          widthFactor: 0.6,
          formAlignment: Alignment.centerLeft,
          showShadow: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TTextWithIcon(text: 'Form 60% - Left', textStyle: Theme.of(context).textTheme.titleMedium),
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
        TFormContainer(
          isLoading: false,
          widthFactor: 0.6,
          formAlignment: Alignment.center,
          showShadow: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TTextWithIcon(text: 'Form 60% - Center', textStyle: Theme.of(context).textTheme.titleMedium),
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
        TFormContainer(
          isLoading: false,
          widthFactor: 0.6,
          formAlignment: Alignment.centerRight,
          showShadow: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TTextWithIcon(text: 'Form 60% - Right', textStyle: Theme.of(context).textTheme.titleMedium),
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
        TFormContainer(
          maxWidth: 500,
          isLoading: true,
          showShadow: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TTextWithIcon(text: 'Form Width 500px', textStyle: Theme.of(context).textTheme.titleMedium),
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
        TFormContainer(
          isLoading: false,
          showShadow: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TTextWithIcon(text: 'Full Width', textStyle: Theme.of(context).textTheme.titleMedium),
              TextField(decoration: InputDecoration(labelText: 'Name')),
              SizedBox(height: 16),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ],
    );
  }
}
