import 'package:flutter/material.dart';
import 'package:my_personal_website/base/base_page.dart';

void main() async {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoaoReisA',
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: Colors.grey[800],
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: ThemeData.dark().copyWith(backgroundColor: Colors.grey[800]),
      home: const BasePage(),
    );
  }
}
