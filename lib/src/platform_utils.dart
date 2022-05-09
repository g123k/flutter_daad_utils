import 'dart:io';

import 'package:flutter/foundation.dart';

class PlatformUtils {
  const PlatformUtils._();

  static String get platformName {
    if (kIsWeb) {
      return 'Web';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isMacOS) {
      return 'MacOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else {
      return 'Unknown';
    }
  }

  static SystemPlatform get platform {
    if (kIsWeb) {
      return SystemPlatform.web;
    } else if (Platform.isAndroid) {
      return SystemPlatform.android;
    } else if (Platform.isIOS) {
      return SystemPlatform.ios;
    } else if (Platform.isMacOS) {
      return SystemPlatform.macos;
    } else if (Platform.isWindows) {
      return SystemPlatform.windows;
    } else if (Platform.isLinux) {
      return SystemPlatform.linux;
    } else {
      return SystemPlatform.unknown;
    }
  }

  static bool get isAComputer =>
      Platform.isWindows || Platform.isMacOS || Platform.isLinux;

  static bool get isASmartphone => Platform.isAndroid || Platform.isIOS;

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  static bool get isCupertino => Platform.isIOS || Platform.isMacOS;
}

enum SystemPlatform {
  web,
  android,
  ios,
  macos,
  windows,
  linux,
  unknown,
}
