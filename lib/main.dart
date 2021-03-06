import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kotuko_coding_challange/ui/pages/homepage.dart';
import 'package:kotuko_coding_challange/core/service/http_overrides.dart';

void main() {
  /// http overrides for certification
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flight Results',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
