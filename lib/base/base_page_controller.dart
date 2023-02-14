import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class BasePageController {
  late AudioPlayer player;
  final isWebMobile = kIsWeb &&
      (defaultTargetPlatform == TargetPlatform.iOS ||
          defaultTargetPlatform == TargetPlatform.android);

  void htmlOpenLink(String url) {
    html.window.open(url, '_blank');
  }

  void init() async {
    if (!isWebMobile) {
      player = AudioPlayer();
      await player.setAsset('assets/audio/MF DOOM - Saffron.mp3');
    }
  }
}
