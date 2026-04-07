import 'package:flutter/material.dart';
import 'package:flutter_application_1/Competicao_TC.dart';
import 'package:flutter_application_1/homepage.dart';
import 'package:flutter_application_1/Detalhespage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
      ),
      home: HomePage(),
    );
  }
}