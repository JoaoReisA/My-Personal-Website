import 'dart:html' as html;

class HomePageController {
  void htmlOpenLink(String url) {
    html.window.open(url, '_blank');
  }
}
