import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/config/images_path.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';
import 'dart:html' as html;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.homeButton,
                style: GoogleFonts.montserrat(),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.projectsButton,
                style: GoogleFonts.montserrat(),
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                Strings.aboutMeButton,
                style: GoogleFonts.montserrat(),
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
            style: GoogleFonts.montserrat()
                .copyWith(fontWeight: FontWeight.bold, fontSize: 65),
          ),
          Text(
            Strings.whatIdo,
            style: GoogleFonts.montserrat()
                .copyWith(color: Colors.grey[700], fontSize: 20),
          ),
        ],
      )),
      persistentFooterButtons: [...iconsList],
    );
  }
}

List<Widget> get iconsList => [
      InkWell(
        onTap: () => htmlOpenLink(Strings.githubUrl),
        child:
            SvgPicture.asset(ImagesPath.githubLogo, semanticsLabel: "GitHub"),
      ),
      InkWell(
        onTap: () => htmlOpenLink(Strings.linkedinUrl),
        child: SvgPicture.asset(ImagesPath.linkedinLogo,
            semanticsLabel: "LinkedIn"),
      ),
      InkWell(
        onTap: () => htmlOpenLink(Strings.instagramUrl),
        child: SvgPicture.asset(ImagesPath.instagramLogo,
            semanticsLabel: "Instagram"),
      ),
    ];

void htmlOpenLink(String url) {
  html.window.open(url, '_blank');
}
