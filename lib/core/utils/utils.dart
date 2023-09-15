import 'dart:async';
import 'dart:io';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

mixin Utils {
  static bool isReachChatView = false;
  static bool isNotiFromToolbar = false;

  static bool? checkEmailFormat(String email) {
    bool? emailFormat;
    if (email != '') {
      emailFormat = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
          .hasMatch(email);
    }
    return emailFormat;
  }

  static DateTime? previous;
  static void masterPrint(String? msg) {
    final DateTime now = DateTime.now();
    if (previous == null) {
      previous = now;
    } else {
      previous = now;
    }
  }

  static bool isLightMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.light;
  }

  static bool? checkColorCodeFormat(String code) {
    bool? codeFormat;
    if (code != '') {
      codeFormat = RegExp(r'^#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})$').hasMatch(code);
    }
    return codeFormat;
  }

  static Color hexToColor(String code, Color defaultColor) {
    if (code != '' && checkColorCodeFormat(code)!) {
      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    } else {
      return defaultColor;
    }
  }

  static Brightness getBrightnessForAppBar(BuildContext context) {
    if (Platform.isAndroid) {
      return Utils.isLightMode(context) ? Brightness.dark : Brightness.light;
    } else {
      return Theme.of(context).brightness;
    }
  }

  static String convertColorToString(Color? color) {
    String convertedColorString = '';

    String colorString = color.toString().toUpperCase();

    colorString = colorString.replaceAll(')', '');

    convertedColorString = colorString.substring(colorString.length - 6);

    return '#$convertedColorString';
  }

  static Future<bool> checkInternetConnectivity() async {
    final ConnectivityResult connectivityResult =
        await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile) {
      // print('Mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // print('Wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return false;
    }
  }

  ///
  ///End
  ///
}

class Debouncer {
  Debouncer({required this.milliseconds});
  final int milliseconds;
  Timer? _timer;
  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}
