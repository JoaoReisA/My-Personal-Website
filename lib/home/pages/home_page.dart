import 'package:flutter/material.dart';
import 'package:my_personal_website/base/base_page_controller.dart';

import '../widget/avatar_group_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = BasePageController();
  PageController pageController = PageController();
  List<Widget> get pages => <Widget>[
        const AvatarGroupWidget(),
        const AvatarGroupWidget(),
        const AvatarGroupWidget(),
        const AvatarGroupWidget()
      ];
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: pageController,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              index > 0
                  ? IconButton(
                      onPressed: () {
                        pageController.previousPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.easeIn);
                      },
                      icon: const Icon(Icons.arrow_upward_rounded))
                  : const SizedBox.shrink(),
              const Spacer(),
              Center(child: pages[index]),
              const Spacer(),
              index != pages.length - 1
                  ? IconButton(
                      onPressed: () {
                        if (index != pages.length - 1) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 200),
                              curve: Curves.easeIn);
                        }
                      },
                      icon: const Icon(Icons.arrow_downward_rounded))
                  : Container()
            ],
          );
        });
  }
}
