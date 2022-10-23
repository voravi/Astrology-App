import 'package:astrology_app/views/home_screen/page/home_screen.dart';
import 'package:astrology_app/views/splash_screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'appRoutes.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes().homePage: (context) => HomePage(),
  AppRoutes().splashScreen: (context) => SplashScreen(),
};
