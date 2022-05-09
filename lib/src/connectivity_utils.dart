import 'package:connectivity/connectivity.dart';

class ConnectivityUtils {
  const ConnectivityUtils._();

  static Future<bool> get isConnectionAvailable {
    return Connectivity().checkConnectivity().then((ConnectivityResult result) {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          return true;
        case ConnectivityResult.none:
        default:
          return false;
      }
    });
  }
}
