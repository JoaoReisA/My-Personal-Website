import 'package:flutter/material.dart';
import 'package:my_personal_website/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/home/pages/home_page.dart';
import 'package:my_personal_website/projects/pages/projects_page.dart';

enum Routes {
  base("/"),
  home("/home"),
  aboutMe("/aboutMe"),
  projects("/projects");

  final String routeName;
  const Routes(this.routeName);
}

class CustomRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    if (settings.name == Routes.home.routeName) {
      return MaterialPageRoute(
          builder: (_) => HomePage(
                onChangeImage: (p0) {},
              ));
    } else if (settings.name == Routes.aboutMe.routeName) {
      return MaterialPageRoute(builder: (_) => const AboutMePage());
    } else if (settings.name == Routes.projects.routeName) {
      return MaterialPageRoute(builder: (_) => const ProjectsPage());
    }

    return MaterialPageRoute(
      builder: (_) => Scaffold(
        body: Center(
          child: Text('Nenhuma rota definida para ${settings.name}.'),
        ),
      ),
    );
  }
}
