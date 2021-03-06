import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:my_personal_website/home/pages/home_page.dart';

import '../config/images_path.dart';
import '../config/strings.dart';
import '../config/text_styles.dart';
import 'base_page_controller.dart';

class BasePage extends StatefulWidget {
  const BasePage({
    Key? key,
  }) : super(key: key);
  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  final controller = BasePageController();
  String imagePath = ImagesPath.dondaBackground;
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
    final size = MediaQuery.of(context).size;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: !controller.isWebMobile
              ? StreamBuilder<PlayerState>(
                  //TODO: Maybe add a music queue
                  stream: controller.player.playerStateStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data!.playing) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () async {
                                  await controller.player.pause();
                                },
                                icon: const Icon(Icons.pause)),
                            size.width > 400
                                ? Text(
                                    Strings.musicTitle,
                                    style: TextStyles.standardTextStyle
                                        .copyWith(fontSize: 16),
                                  )
                                : Container(),
                            const SizedBox(width: 10),
                            Lottie.asset(
                              'assets/lottie/music-waves.json',
                              width: 20,
                              height: 20,
                            ),
                          ],
                        );
                      }
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () async {
                                await controller.player.play();
                              },
                              icon: const Icon(Icons.play_arrow)),
                          size.width > 400
                              ? Text(
                                  Strings.musicTitle,
                                  style: TextStyles.standardTextStyle
                                      .copyWith(fontSize: 16),
                                )
                              : Container(),
                          const SizedBox(width: 10),
                          Lottie.asset('assets/lottie/music-waves.json',
                              width: 20, height: 20, animate: false),
                        ],
                      );
                    }
                    return Container();
                  })
              : const SizedBox.shrink(),
        ),
        body: const HomePage(),
        persistentFooterButtons: [...iconsList],
      ),
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
                    color: Colors.white,
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
                    color: Colors.white,
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
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              Strings.footerText,
              style: GoogleFonts.montserrat().copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Colors.white),
            ),
          ],
        ),
      ];
}
