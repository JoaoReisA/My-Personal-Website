import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_personal_website/data/model/blog_model.dart';
import 'package:my_personal_website/data/repository/remote_blog_repository.dart';
import 'package:my_personal_website/domain/repository/blog/blog_repository.dart';

void main() {
  late BlogRepository repository;
  setUp(() {
    repository = RemoteBlogRepository(Dio());
  });

  group(
    RemoteBlogRepository,
    () {
      test('Should', () async {
        //Arrange

        //Act
        final result = await repository.getBlogInfo();
        //Assert
        expect(result, isA<BlogModel>());
      });
    },
  );
}
