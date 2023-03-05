import 'package:flutter_test/flutter_test.dart';
import 'package:requester/core/utils/text_tools.dart';

void main() {
  group('makestandardUrl', () {
    test('should be return https://ubuntu.com/', () async {
      // arrange
      const tUrl = 'https://ubuntu.com/';
      // act
      final result = TextTools.makestandardUrl(tUrl);
      // assert
      expect(result, 'https://ubuntu.com/');
    });

    test('should ', () async {
      // arrange
      const tUrl = 'ubuntu.com/';
      // act
      final result = TextTools.makestandardUrl(tUrl);
      // assert
      expect(result, 'https://ubuntu.com/');
    });
  });
}
