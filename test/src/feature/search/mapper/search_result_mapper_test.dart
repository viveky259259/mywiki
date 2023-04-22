import 'package:flutter_test/flutter_test.dart';
import 'package:mywiki/src/feature/search/mapper/search_result_mapper.dart';
import 'package:mywiki/src/feature/search/model/search_result.dart';
import 'package:mywiki/src/feature/search/model/search_result_dto.dart';

void main() {
  group('test SearchResultMapper', () {
    test(
        'call getThumbnailModelFromThumbnailDto and check if Thumbnail is converted to ThumbnailModel  ',
        () {
      final Thumbnail testThumbnail =
          Thumbnail(height: 10, source: 'image_url', width: 10);
      const ThumbnailModel expectedThumbnailModel =
          ThumbnailModel(height: 10, source: 'image_url', width: 10);

      expect(
          SearchResultMapper.getThumbnailModelFromThumbnailDto(testThumbnail),
          expectedThumbnailModel);
    });

    test('', () {});
  });
}
