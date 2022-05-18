import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/config/text_styles.dart';
import 'package:my_personal_website/home/pages/home_page_controller.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

import '../../config/images_path.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.changeDarkMode}) : super(key: key);
  final VoidCallback changeDarkMode;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();
  bool isDarkMode = true;
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
                  widget.changeDarkMode();
                  isDarkMode = !isDarkMode;
                });
              },
              icon: Icon(isDarkMode ? Icons.sunny : Icons.dark_mode)),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.homeButton,
                style: TextStyles.textButtonStyles,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.projectsButton,
                style: TextStyles.textButtonStyles,
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.aboutMeButton,
                style: TextStyles.textButtonStyles,
              )),
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AvatarWidget(),
          Text(
            Strings.introduction,
            style: TextStyles.titleTextStyle,
          ),
          Text(
            Strings.whatIdo,
            style: TextStyles.subtitleTextStyle,
          ),
        ],
      )),
      persistentFooterButtons: [...iconsList],
    );
  }

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
