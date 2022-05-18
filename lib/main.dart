import 'package:flutter/material.dart';
import 'package:my_personal_website/home/pages/home_page.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  bool isDarkMode = true;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JoaoReisA',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(
        changeDarkMode: () => setState(
          () {
            isDarkMode = !isDarkMode;
          },
        ),
      ),
      darkTheme: isDarkMode ? ThemeData.dark() : null,
    );
  }
}
