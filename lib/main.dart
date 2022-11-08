import 'package:flutter/material.dart';
import 'package:modul7/list_countries.dart';
import 'page_detail_countries.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nadia/124200014',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        scaffoldBackgroundColor: Colors.yellow[500],
        // scaffoldBackgroundColor: Colors.black,
      ),
      home: ListCountries(),
    );
  }
}