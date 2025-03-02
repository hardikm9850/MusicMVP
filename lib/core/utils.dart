import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConst {
  /// Supported locale inside the app
  static const kSupportedLocals = [Locale('en')];

  /// Api Endpoint
  static const String kApiEndPoint = 'http://ws.audioscrobbler.com/2.0/';

  /// Api Endpoint
  static const String kApiKey = 'bb5f61a90397c220424a8b4220ea5d88';

  ///
  static const String kAssetsEndPoint =
      'https://www.metaweather.com/static/img/weather/';

  /// App Name
  static const String kMaterialAppTitle = 'Music App';

  /// App Primary Color
  static const Color kAppPrimaryColor = Colors.white;

  /// App Secondory Color

  static const Color kAppSecondaryColor = Color(0xffc4a35a);

  /// App scaffold bg Color

  static const Color kAppScaffoldBgColor = Color(0xff2e2e2d);

  /// App sizes

  static const double kHeadlineSize1 = 24;
  static const double kHeadlineSize2 = 30;
  static const double kBody2Size = 22;

  static ThemeData getAppTheme() {
    ThemeData theme = ThemeData.light();
    return theme.copyWith(
        scaffoldBackgroundColor: kAppScaffoldBgColor,
        primaryColor: kAppPrimaryColor,
        colorScheme: theme.colorScheme.copyWith(secondary: kAppPrimaryColor),
        textTheme: theme.textTheme.copyWith(
            headlineSmall: theme.textTheme.headlineSmall?.copyWith(
              fontSize: kHeadlineSize1,
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
            headlineMedium: theme.textTheme.headlineMedium?.copyWith(
              fontSize: kHeadlineSize2,
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
            headlineLarge: theme.textTheme.headlineLarge?.copyWith(
              fontSize: kHeadlineSize1,
              color: Colors.white,
              // fontWeight: FontWeight.bold,
            ),
            bodyMedium: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white,
            ),
            bodySmall: theme.textTheme.bodySmall
                ?.copyWith(color: Colors.white, fontSize: kBody2Size)));
  }
}

class Utils {
  static getAssetsLink(String abr) {
    return '${AppConst.kAssetsEndPoint}$abr.svg';
  }
}

class AppDateUtils {
  DateTime _dateTime;
  AppDateUtils(this._dateTime);
  factory AppDateUtils.fromYYYYMMdd(String date) {
    return AppDateUtils(DateFormat('yyyy-MM-dd').parse(date));
  }
  String getDayOfTheWeek() {
    return DateFormat('EEEE').format(_dateTime);
  }
}
