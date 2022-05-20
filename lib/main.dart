import 'package:flutter/material.dart';
import 'package:my_personal_website/base_page.dart';

import 'config/route_enum.dart';

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
        backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      darkTheme: isDarkMode
          ? ThemeData.dark().copyWith(backgroundColor: Colors.grey[800])
          : null,
      onGenerateRoute: CustomRouter.generateRoutes,
      home: BasePage(
          arguments: BasePageArguments(
        () => setState(
          () {
            isDarkMode = !isDarkMode;
          },
        ),
      )),
    );
  }
}
