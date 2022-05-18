import 'package:flutter/material.dart';
import 'package:my_personal_website/home/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoaoReisA',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(),
    );
  }
}
