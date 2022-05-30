import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:my_personal_website/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/home/pages/home_page.dart';
import 'package:my_personal_website/projects/pages/projects_page.dart';

import '../config/images_path.dart';
import '../config/strings.dart';
import '../config/text_styles.dart';
import 'base_page_controller.dart';

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
  final controller = BasePageController();
  int index = 0;
  String imagePath = ImagesPath.dondaBackground;
  bool isAudioRunning = false;
  @override
  void initState() {
    super.initState();

    controller.init();
  }

  @override
  void dispose() {
    super.dispose();
    controller.player.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Text.rich(TextSpan(
                text: Strings.firstName,
                style: TextStyles.standardPurpleStyle,
                children: [
                  TextSpan(
                      text: Strings.middleName,
                      style: TextStyles.standardPurpleBoldStyle)
                ],
              )),
              StreamBuilder<PlayerState>(
                  //TODO: Maybe add a music queue
                  //TODO: Put the name of the song playing in the appbar
                  stream: controller.player.playerStateStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.playing) {
                        return Row(
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await controller.player.pause();
                                },
                                icon: const Icon(Icons.pause)),
                            Text(
                              "True Love - Kanye West ft xxxtentacion",
                              style: TextStyles.standardTextStyle
                                  .copyWith(fontSize: 16),
                            ),
                            Lottie.asset(
                              'assets/lottie/music-waves.json',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        );
                      }
                      return Row(
                        children: [
                          IconButton(
                              onPressed: () async {
                                await controller.player.play();
                              },
                              icon: const Icon(Icons.play_arrow)),
                          Text(
                            "True Love - Kanye West ft xxxtentacion",
                            style: TextStyles.standardTextStyle
                                .copyWith(fontSize: 16),
                          ),
                          Lottie.asset('assets/lottie/music-waves.json',
                              width: 20, height: 20, animate: false),
                        ],
                      );
                    }
                    return Container();
                  }),
            ],
          ),
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
                // setState(() {
                //   index = 1;
                // });
                controller.htmlOpenLink(Strings.githubUrl);
              },
              child: Text(
                Strings.projectsButton,
                style: TextStyles.textButtonStyles,
              ),
            ),
            // TextButton(
            //     onPressed: () {
            //       setState(() {
            //         index = 2;
            //       });
            //     },
            //     child: Text(
            //       Strings.aboutMeButton,
            //       style: TextStyles.textButtonStyles,
            //     )),
          ],
        ),
        body: bodyList[index],
        persistentFooterButtons: [...iconsList],
      ),
    );
  }

  List<Widget> get bodyList => [
        const HomePage(),
        const ProjectsPage(),
        const AboutMePage(),
      ];

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
