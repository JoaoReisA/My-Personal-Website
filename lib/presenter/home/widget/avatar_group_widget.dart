import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_personal_website/presenter/home/widget/show_avatars.dart';

import '../../../config/strings.dart';
import '../../../config/text_styles.dart';

class AvatarGroupWidget extends StatelessWidget {
  const AvatarGroupWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isWebMobile = kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
    return Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
                child: Padding(
              padding: EdgeInsets.only(left: isWebMobile ? 0 : 180.0),
              child: const AvatarWidget(),
            )),
            Text(
              Strings.introduction,
              style: TextStyles.titleTextStyle,
              textAlign: TextAlign.center,
            ),
            Text(
              Strings.whatIdo,
              style: TextStyles.subtitleTextStyle
                  .copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ],
    );
  }
}
