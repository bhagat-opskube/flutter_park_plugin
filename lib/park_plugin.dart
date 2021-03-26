
import 'package:flutter/material.dart';
import 'package:flutter_park_plugin/api/apis.dart';

/// A Class to init HotelPlugin.
class ParkPlugin {
  static GlobalKey<NavigatorState>? navigatorKey;
  init({required GlobalKey<NavigatorState> navigatorKey,required String apiBaseUrl})
  {
    ParkPlugin.navigatorKey=navigatorKey;
    Config.API_BASE_URL=apiBaseUrl;
  }

}