import 'package:flutter/material.dart';
import 'package:my_personal_website/config/images_path.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
