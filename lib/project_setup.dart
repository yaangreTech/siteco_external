import 'package:flutter/material.dart';
import 'package:siteco_external/widgets/small_screen_app_bar.dart';

class ProjectStup extends StatefulWidget {
  const ProjectStup({Key? key}) : super(key: key);

  @override
  State<ProjectStup> createState() => _ProjectStupState();
}

class _ProjectStupState extends State<ProjectStup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            LargeScreenAppBar
          ],
        ),
      ),
    );
  }
}
