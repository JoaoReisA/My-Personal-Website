import 'package:dio/dio.dart';
import 'package:my_personal_website/data/model/blog_model.dart';
import 'package:my_personal_website/domain/repository/blog/blog_repository.dart';

class RemoteBlogRepository implements BlogRepository {
  RemoteBlogRepository(this.client);

  final Dio client;

  @override
  Future<BlogModel> getBlogInfo() async {
    const url =
        'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/@joao.reisa13';
    final json = await client.get(url,
        options: Options(
          contentType: Headers.jsonContentType,
          responseType: ResponseType.json,
        ));

    final response = BlogModel.fromJson(json.data);

    return response;
  }
}
