import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_personal_website/presenter/about_me/pages/about_me_page.dart';
import 'package:my_personal_website/presenter/base/base_page_controller.dart';

import '../widget/avatar_group_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = BasePageController();
  PageController pageController = PageController();
  List<Widget> get pages => <Widget>[
        const AvatarGroupWidget(),
        const AboutMePage(),
      ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        itemCount: pages.length,
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              index > 0
                  ? InkWell(
                      onTap: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      },
                      child: Lottie.asset(
                        'assets/lottie/arrow-up.json',
                        width: 30,
                        height: 30,
                      ),
                    )
                  : const SizedBox.shrink(),
              const Spacer(),
              Center(child: pages[index]),
              const Spacer(),
              index != pages.length - 1
                  ? InkWell(
                      onTap: () {
                        if (index != pages.length - 1) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        }
                      },
                      child: Lottie.asset(
                        'assets/lottie/arrow-down.json',
                        width: 40,
                        height: 40,
                      ),
                    )
                  : const SizedBox.shrink()
            ],
          );
        });
  }
}
