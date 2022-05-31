import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mouse_parallax/mouse_parallax.dart';
import 'package:my_personal_website/config/images_path.dart';
import 'package:my_personal_website/home/widget/change_avatar_configs.dart';

class AvatarWidget extends StatefulWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  State<AvatarWidget> createState() => _AvatarWidgetState();
}

class _AvatarWidgetState extends State<AvatarWidget> {
  bool hoverIsOn = false;
  bool showSelectionBanner = false;
  bool hoverIsEnabled = true;
  PageController pageController = PageController();
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);
  Color color = Colors.green;

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
        padding: const EdgeInsets.only(),
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
                  color: Theme.of(context).backgroundColor,
                  borderRadius: BorderRadiusDirectional.circular(16)),
              child: ParallaxStack(
                layers: [
                  ParallaxLayer(
                    yRotation: 0.50,
                    xRotation: 0.50,
                    xOffset: 30,
                    yOffset: 30,

                    // xRotation: 60,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              color,
                              Colors.deepPurple,
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
                                );
                              }),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            !isWebMobile
                ? Row(
                    children: [
                      Visibility(
                        visible: hoverIsOn,
                        child: IconButton(
                          splashColor: Colors.purple,
                          color: Colors.white,
                          icon: const Icon(Icons.drag_indicator),
                          onPressed: () {
                            setState(() {
                              showSelectionBanner = !showSelectionBanner;
                              hoverIsEnabled = !hoverIsEnabled;
                            });
                          },
                        ),
                        replacement: Container(width: 40),
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
                        onClickColor: (selectedColor) {
                          setState(() {
                            color = selectedColor;
                          });
                        },
                        color: color,
                      )
                    ],
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
