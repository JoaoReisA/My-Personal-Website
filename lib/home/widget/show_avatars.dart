import 'package:flutter/material.dart';
import 'package:my_personal_website/config/images_path.dart';
import 'package:my_personal_website/config/strings.dart';
import 'package:my_personal_website/home/widget/change_avatar_configs.dart';

class AvatarWidget extends StatefulWidget {
  AvatarWidget({Key? key}) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  bool hoverIsOn = false;
  bool showSelectionBanner = false;
  bool hoverIsEnabled = true;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {},
      onHover: hoverIsEnabled
          ? (value) {
              setState(() {
                hoverIsOn = value;
              });
            }
          : null,
      child: Padding(
        padding: const EdgeInsets.only(left: 160),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(color: Colors.black54, offset: Offset(-0.5, 1))
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [
                        Colors.purple,
                        Colors.green,
                      ], begin: Alignment.bottomLeft),
                      borderRadius: BorderRadiusDirectional.circular(16)),
                  child: Center(
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: ImagesPath.imagesList.length,
                        itemBuilder: (context, index) {
                          final list = ImagesPath.imagesList;
                          return Image.asset(
                            list[index],
                            width: 60,
                          );
                        }),
                  ),
                ),
              ),
            ),
            Visibility(
              visible: hoverIsOn,
              child: IconButton(
                splashColor: Colors.purple,
                color: Colors.deepPurple,
                icon: const Icon(Icons.drag_indicator),
                onPressed: () {
                  setState(() {
                    showSelectionBanner = !showSelectionBanner;
                    hoverIsEnabled = !hoverIsEnabled;
                  });
                },
              ),
              replacement: Container(
                width: 40,
              ),
            ),
            ChangeAvatarConfigs(
              showSelectionBanner: showSelectionBanner,
              onClickBack: () {
                pageController.previousPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeOut);
              },
              onClickFoward: () {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeIn);
              },
            )
          ],
        ),
      ),
    );
  }
}
