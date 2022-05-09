import 'package:package_info_plus/package_info_plus.dart';

class AppUtils {
  const AppUtils._();

  static Future<String> get appVersion =>
      PackageInfo.fromPlatform().then((PackageInfo package) => package.version);

  static Future<String> get appBuildNumber => PackageInfo.fromPlatform()
      .then((PackageInfo package) => package.buildNumber);

  static Future<String> get appFullVersion =>
      Future.wait<String>(<Future<String>>[appVersion, appBuildNumber]).then(
          (List<String> values) => Future<String>.value(values.join('+')));

  static String generateId() =>
      DateTime.now().millisecondsSinceEpoch.toString();
}
