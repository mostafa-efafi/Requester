import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

/// Return [true] if the device was connected to the Internet, otherwise [false]
class NetworkChecker {
  static Future<bool> checkConnection() async {
    if (kIsWeb) {
      return true;
    } else {
      var connectivityResult = await (Connectivity().checkConnectivity());
      return connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi;
    }
  }
}
