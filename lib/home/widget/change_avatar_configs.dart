import 'package:flutter/material.dart';
import 'package:my_personal_website/config/strings.dart';

class ChangeAvatarConfigs extends StatelessWidget {
  const ChangeAvatarConfigs(
      {Key? key,
      required this.showSelectionBanner,
      required this.onClickBack,
      required this.onClickFoward})
      : super(key: key);
  final bool showSelectionBanner;
  final VoidCallback onClickBack;
  final VoidCallback onClickFoward;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showSelectionBanner,
      child: Container(
        height: 150,
        width: 120,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(color: Colors.black54, offset: Offset(-0.5, 1))
          ],
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(Strings.avatar),
                  Row(
                    children: [
                      InkWell(
                        onTap: onClickBack,
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 15,
                          color: Colors.deepPurple,
                        ),
                      ),
                      InkWell(
                        onTap: onClickFoward,
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.deepPurple,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              ),
              const Text(Strings.background)
            ],
          ),
        ),
      ),
      replacement: Container(
        width: 120,
      ),
    );
  }
}
