import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:requester/core/rest/network_checker.dart';
import 'package:requester/di.dart';

import 'network_checker_test.mocks.dart';

@GenerateMocks([Connectivity])
late MockConnectivity mockConnectivity;

void main() {
  group('checkConnection method', () {
    mockConnectivity = MockConnectivity();
    final networkChecker = di<NetworkChecker>();
    test('Should return true when mobile data is on', () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.mobile);
      // act
      final result = await networkChecker.checkConnection();
      // assert
      expect(result, true);
    });

    test('Should return true when wifi is on', () async {
      // arrange
      when(mockConnectivity.checkConnectivity())
          .thenAnswer((realInvocation) async => ConnectivityResult.wifi);
      // act
      final result = await networkChecker.checkConnection();
      // assert
      expect(result, true);
    });
  });
}
