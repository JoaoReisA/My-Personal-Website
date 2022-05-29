import 'package:flutter/material.dart';
import 'package:my_personal_website/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/config/images_path.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/config/text_styles.dart';
import 'package:my_personal_website/base/base_page_controller.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = BasePageController();
  double get height {
    return MediaQuery.of(context).size.height;
  }

  double get width {
    return MediaQuery.of(context).size.width;
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  double top1 = 220;
  double top2 = 700;

  double actualHeight = 0;
  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (v) {
        setState(() {
          top1 = top1 - v.scrollDelta! / 2;
          top2 = top2 - v.scrollDelta! / 1;
        });
        return true;
      },
      child: LayoutBuilder(builder: (context, constraints) {
        double tempHeight = constraints.maxHeight + 650;

        actualHeight = tempHeight;
        return Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: top1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AvatarWidget(),
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
            ),
            Positioned(
              top: top2,
              child: const Padding(
                  padding: EdgeInsets.only(top: 100.0, bottom: 30),
                  child: AboutMePage()),
            ),
            ListView(
              children: [
                Container(
                  height: actualHeight,
                  // height: 1400,
                  color: Colors.transparent,
                ),
              ],
            ),
          ],
        );
      }),
    );
  }
}
