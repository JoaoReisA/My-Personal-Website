class BlogItemsModel {
  String? title;
  String? pubDate;
  String? link;
  String? guid;
  String? author;
  String? thumbnail;
  String? description;
  String? content;
  List<String>? categories;

  BlogItemsModel(
      {this.title,
      this.pubDate,
      this.link,
      this.guid,
      this.author,
      this.thumbnail,
      this.description,
      this.content,
      this.categories});

  BlogItemsModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    pubDate = json['pubDate'];
    link = json['link'];
    guid = json['guid'];
    author = json['author'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    content = json['content'];
    categories = json['categories'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['pubDate'] = pubDate;
    data['link'] = link;
    data['guid'] = guid;
    data['author'] = author;
    data['thumbnail'] = thumbnail;
    data['description'] = description;
    data['content'] = content;
    data['categories'] = categories;
    return data;
  }
}
