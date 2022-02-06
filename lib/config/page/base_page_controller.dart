import 'dart:async';

import 'package:my_personal_website/config/route_enum.dart';

class BasePageController {
  final StreamController<PagesEnum> _streamController =
      StreamController.broadcast();

  Stream<PagesEnum> get streamController => _streamController.stream;

  void pushRoute(PagesEnum pagesEnum) {
    _streamController.add(pagesEnum);
  }

  void disposeStream() {
    _streamController.close();
  }
}
