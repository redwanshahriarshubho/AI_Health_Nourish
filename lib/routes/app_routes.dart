import 'package:flutter/material.dart';
import '../core/app_export.dart';
import '../presentation/app_navigation_screen/app_navigation_screen.dart';
import '../presentation/loading_screen/loading_screen.dart';
import '../presentation/one_screen/one_screen.dart';
import '../presentation/six_screen/six_screen.dart';
import '../presentation/three_screen/three_screen.dart';
import '../presentation/two_screen/two_screen.dart'; // ignore_for_file: must_be_immutable

// ignore_for_file: must_be_immutable
class AppRoutes {
  static const String oneScreen = '/one_screen';

  static const String twoScreen = '/two_screen';

  static const String threeScreen = '/three_screen';

  static const String sixScreen = '/six_screen';

  static const String loadingScreen = '/loading_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static const String fourScreen = '/four_screen';


  static Map<String, WidgetBuilder> routes = {
    oneScreen: (context) => OneScreen(),
    twoScreen: (context) => TwoScreen(),
    threeScreen: (context) => ThreeScreen(),
    sixScreen: (context) => SixScreen(),
    loadingScreen: (context) => LoadingScreen(),
    appNavigationScreen: (context) => AppNavigationScreen(),
    initialRoute: (context) => OneScreen()

  };
}
