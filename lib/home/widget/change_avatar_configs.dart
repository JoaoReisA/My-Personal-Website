import 'package:flutter/material.dart';
import 'package:my_personal_website/config/strings.dart';

class ChangeAvatarConfigs extends StatelessWidget {
  const ChangeAvatarConfigs({Key? key, required this.showSelectionBanner})
      : super(key: key);
  final bool showSelectionBanner;
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
                children: const [
                  Text(Strings.avatar),
                  SizedBox(
                    width: 20,
                  ),
                  Text("Botao")
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
    );
  }
}
