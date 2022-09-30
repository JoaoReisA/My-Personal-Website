import 'blog_items_model.dart';
import 'feed_model.dart';

class BlogModel {
  String? status;
  FeedModel? feed;
  List<BlogItemsModel>? items;

  BlogModel({this.status, this.feed, this.items});

  BlogModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    feed = json['feed'] != null ? FeedModel.fromJson(json['feed']) : null;
    if (json['items'] != null) {
      items = <BlogItemsModel>[];
      json['items'].forEach((v) {
        items!.add(BlogItemsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (feed != null) {
      data['feed'] = feed!.toJson();
    }
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
