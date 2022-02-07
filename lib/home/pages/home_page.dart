import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_personal_website/config/images_path.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool showDescription = false;
  late final AnimationController _animatedController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
    value: 0.7,
  );
  @override
  void dispose() {
    _animatedController.dispose();
    super.dispose();
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
      body: Stack(
        children: [
          AnimatedPositioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            duration: const Duration(milliseconds: 500),
            child: AvatarWidget(),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DefaultTextStyle(
                    style: GoogleFonts.montserrat()
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 65),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TypewriterAnimatedText(Strings.introduction),
                      ],
                      isRepeatingAnimation: false,
                      onFinished: () => setState(() {
                        showDescription = true;
                      }),
                    ),
                  ),
                ),
                Expanded(
                  child: Visibility(
                    visible: showDescription,
                    child: DefaultTextStyle(
                      style: GoogleFonts.montserrat()
                          .copyWith(color: Colors.grey[700], fontSize: 20),
                      child: AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(Strings.whatIdo),
                        ],
                        isRepeatingAnimation: false,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
