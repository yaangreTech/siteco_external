import 'package:flutter/material.dart';
import 'package:siteco_external/home.dart';
import 'package:siteco_external/project_setup.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        fontFamily: 'Medium Helvetica',
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
    initialRoute: '/project_setup',
    routes: {
      '/': (context) => const Home(),
      '/project_setup': (context)=>ProjectSetup(),
    },
  ));
}

