import 'package:flutter/material.dart';
import 'package:t_utils/common/widgets/appbar/appbar.dart';
import 'package:t_utils/common/widgets/exports.dart';
import 'package:t_utils/utils/constants/colors.dart';

/// Example screen demonstrating the usage of [TAppBar].
class CustomHeaderExampleScreen extends StatelessWidget {
  CustomHeaderExampleScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAdminHeader(scaffoldKey: scaffoldKey, ),
      body: const Center(
        child: Text(
          'This is the body of the CustomAppBar example screen.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
