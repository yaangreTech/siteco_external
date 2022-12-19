import 'package:flutter/material.dart';
import 'package:siteco_external/Consts/pagenames.dart';
import 'package:siteco_external/home.dart';
import 'package:siteco_external/project_setup.dart';
import 'package:siteco_external/widgets/restart_app.dart';
import 'new_project.dart';

void main() {
  runApp(RestartWidget(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'HelveticaNowText',
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme(
              brightness: Brightness.light,
              primary: Color(0xFFF40505),
              onPrimary: Color(0xFFFFFFFF),
              secondary: Color(0xFF707070),
              onSecondary: Color(0xFFFFFFFF),
              error: Color(0xFFF39E9E),
              onError: Color(0xFFCE2C2C),
              background: Color(0xFFFFFFFF),
              onBackground: Color(0xFF707070),
              surface: Color(0xFFFFFFFF),
              onSurface: Color(0xFF707070))),
      initialRoute: HOME,
      routes: {
        HOME: (context) => const Home(),
        PROJECT_SETUP: (context)=>NewProject(),
      },
    ),
  ));
}

