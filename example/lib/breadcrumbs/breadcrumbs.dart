import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/breadcrumbs/breadcrumb_with_heading.dart';

class TBreadcrumbWithHeading extends StatelessWidget {
  const TBreadcrumbWithHeading({super.key});

  @override
  Widget build(BuildContext context) {
    return TBreadcrumbsWithHeading(
      heading: 'Update Brand',
      homeTitle: const Text('Home'),
      subHeading: 'Edit details of the brand',
      homeOnTap: () {
        // Navigate to dashboard or home screen
        Navigator.pushNamed(context, '/home');
      },
      returnToPreviousScreen: true,
      breadcrumbItems: ['/categories', 'Update Brand'],
      breadcrumbItemsTextStyle:
          const TextStyle(fontSize: 14, color: Colors.black87),
    );
  }
}
