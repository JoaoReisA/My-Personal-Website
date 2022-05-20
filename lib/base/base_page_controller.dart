import 'dart:html' as html;

class BasePageController {
  void htmlOpenLink(String url) {
    html.window.open(url, '_blank');
  }
}
