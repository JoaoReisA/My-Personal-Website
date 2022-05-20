import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/home/pages/home_page.dart';
import 'package:my_personal_website/projects/pages/projects_page.dart';

import 'config/images_path.dart';
import 'config/strings.dart';
import 'config/text_styles.dart';
import 'home/pages/home_page_controller.dart';

class BasePageArguments {
  final VoidCallback changeDarkMode;

  BasePageArguments(this.changeDarkMode);
}

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.arguments}) : super(key: key);
  final BasePageArguments arguments;
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  bool isDarkMode = true;
  final controller = HomePageController();
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text.rich(TextSpan(
          text: Strings.firstName,
          style: TextStyles.standardPurpleStyle,
          children: [
            TextSpan(
                text: Strings.middleName,
                style: TextStyles.standardPurpleBoldStyle)
          ],
        )),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  widget.arguments.changeDarkMode();
                  isDarkMode = !isDarkMode;
                });
              },
              icon: Icon(isDarkMode ? Icons.sunny : Icons.dark_mode)),
          TextButton(
              onPressed: () {
                setState(() {
                  index = 0;
                });
              },
              child: Text(
                Strings.homeButton,
                style: TextStyles.textButtonStyles,
              )),
          TextButton(
            onPressed: () {
              setState(() {
                index = 1;
              });
            },
            child: Text(
              Strings.projectsButton,
              style: TextStyles.textButtonStyles,
            ),
          ),
          TextButton(
              onPressed: () {
                setState(() {
                  index = 2;
                });
              },
              child: Text(
                Strings.aboutMeButton,
                style: TextStyles.textButtonStyles,
              )),
        ],
      ),
      body: bodyList[index],
      persistentFooterButtons: [...iconsList],
    );
  }

  List<Widget> get bodyList =>
      [const HomePage(), const ProjectsPage(), const AboutMePage()];

  List<Widget> get iconsList => [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () => controller.htmlOpenLink(Strings.githubUrl),
                  child: SvgPicture.asset(
                    ImagesPath.githubLogo,
                    semanticsLabel: "GitHub",
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => controller.htmlOpenLink(Strings.linkedinUrl),
                  child: SvgPicture.asset(
                    ImagesPath.linkedinLogo,
                    semanticsLabel: "LinkedIn",
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => controller.htmlOpenLink(Strings.instagramUrl),
                  child: SvgPicture.asset(
                    ImagesPath.instagramLogo,
                    semanticsLabel: "Instagram",
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            Text(
              Strings.footerText,
              style: GoogleFonts.montserrat().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.deepPurple),
            ),
          ],
        ),
      ];
}