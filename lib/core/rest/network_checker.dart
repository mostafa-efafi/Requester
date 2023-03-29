import 'dart:io';

/// Return [true] if the device was connected to the Internet, otherwise [false]
class NetworkChecker {
  static const urlTest = 'google.com';
  Future<bool> checkConnection() async {
    try {
      final result = await InternetAddress.lookup(urlTest);
      if (result.isNotEmpty && result.first.rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      return false;
    }
    return false;
  }
}
