import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/config/page/base_page_controller.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/pages/home_page.dart';

import '../route_enum.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key}) : super(key: key);
  final BasePageController controller = BasePageController();

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  @override
  void dispose() {
    super.dispose();
    widget.controller.disposeStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(TextSpan(
          text: Strings.firstName,
          style: GoogleFonts.montserrat(color: Colors.purple),
          children: [
            TextSpan(
                text: Strings.middleName,
                style: GoogleFonts.montserrat(color: Colors.purple)
                    .copyWith(fontWeight: FontWeight.bold))
          ],
        )),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.dark_mode_outlined),
            color: Colors.purple,
          ),
          TextButton(
              onPressed: () => widget.controller.pushRoute(PagesEnum.homePage),
              child: Text(Strings.homeButton,
                  style: GoogleFonts.montserrat(color: Colors.purple))),
          TextButton(
              onPressed: () =>
                  widget.controller.pushRoute(PagesEnum.projectsPage),
              child: Text(
                Strings.projectsButton,
                style: GoogleFonts.montserrat(color: Colors.purple),
              )),
          TextButton(
              onPressed: () =>
                  widget.controller.pushRoute(PagesEnum.aboutMePage),
              child: Text(
                Strings.aboutMeButton,
                style: GoogleFonts.montserrat(color: Colors.purple),
              )),
        ],
      ),
      body: StreamBuilder<PagesEnum>(
          stream: widget.controller.streamController,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final state = snapshot.data;
              switch (state) {
                case PagesEnum.homePage:
                  return const HomePage();
                case PagesEnum.projectsPage:
                  return Container();
                case PagesEnum.aboutMePage:
                  return const AboutMePage();
                default:
                  return const HomePage();
              }
            }
            return const HomePage();
          }),
    );
  }
}
