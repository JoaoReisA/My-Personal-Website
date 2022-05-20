import 'package:flutter/material.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/config/text_styles.dart';
import 'package:my_personal_website/home/pages/home_page_controller.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: AvatarWidget()),
          Text(
            Strings.introduction,
            style: TextStyles.titleTextStyle,
            textAlign: TextAlign.center,
          ),
          Text(
            Strings.whatIdo,
            style: TextStyles.subtitleTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
