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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          hoverIsOn = value;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
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
                  child: Image.asset(
                    ImagesPath.blinkAvatar,
                    width: 75,
                  ),
                ),
              ),
            ),
          ),
          Visibility(
              maintainState: true,
              visible: hoverIsOn,
              child: IconButton(
                color: Colors.deepPurple,
                icon: const Icon(Icons.drag_indicator),
                onPressed: () {
                  setState(() {
                    showSelectionBanner = !showSelectionBanner;
                    hoverIsOn = true;
                  });
                },
              )),
          ChangeAvatarConfigs(
            showSelectionBanner: showSelectionBanner,
          )
        ],
      ),
    );
  }
}
