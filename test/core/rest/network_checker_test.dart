import 'package:flutter_test/flutter_test.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/di.dart';

void main() {
  group('checkConnection method', () {
    final networkChecker = di<NetworkChecker>();
    test('When internet connection is available', () async {
      //arrange
      bool expected = true;
      //act
      bool actual = await networkChecker.checkConnection();
      //assert
      expect(actual, expected);
    });

    test('When internet connection is not available', () async {
      /// turn off [wifi] and [data]
      //arrange
      bool expected = false;
      //act
      bool actual = await networkChecker.checkConnection();
      //assert
      expect(actual, expected);
    });
  });
}
