import 'package:flutter/material.dart';
import 'package:my_personal_website/config/text_styles.dart';

import '../../config/strings.dart';

class AboutMePage extends StatefulWidget {
  const AboutMePage({Key? key}) : super(key: key);

  @override
  _AboutMePageState createState() => _AboutMePageState();
}

class _AboutMePageState extends State<AboutMePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text("Sobre Mim", style: TextStyles.titleTextStyle),
          SizedBox(
              child: Text(
            Strings.aboutMeDescription,
            style: TextStyles.standardTextStyle.copyWith(
              fontSize: 20,
            ),
            textAlign: TextAlign.center,
          ))
        ],
      ),
    );
  }
}
