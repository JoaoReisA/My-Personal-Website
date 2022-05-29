import 'package:flutter/material.dart';
import 'package:my_personal_website/home/widget/show_avatars.dart';

import '../../config/strings.dart';
import '../../config/text_styles.dart';

class AvatarGroupWidget extends StatelessWidget {
  const AvatarGroupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
