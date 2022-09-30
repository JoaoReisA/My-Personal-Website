class FeedModel {
  String? url;
  String? title;
  String? link;
  String? author;
  String? description;
  String? image;

  FeedModel(
      {this.url,
      this.title,
      this.link,
      this.author,
      this.description,
      this.image});

  FeedModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    title = json['title'];
    link = json['link'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['title'] = title;
    data['link'] = link;
    data['author'] = author;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
