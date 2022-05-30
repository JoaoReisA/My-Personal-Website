import 'dart:html' as html;

import 'package:just_audio/just_audio.dart';

class BasePageController {
  late AudioPlayer player;

  void htmlOpenLink(String url) {
    html.window.open(url, '_blank');
  }

  void init() async {
    player = AudioPlayer();
    await player.setAsset('assets/audio/true_love.mp3');
    // await player.play();
  }
}
