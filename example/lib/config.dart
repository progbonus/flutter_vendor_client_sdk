import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

abstract class IAppConfig {
  // ignore: non_constant_identifier_names
  String get PROGBONUS_TENANT_ID;
  // ignore: non_constant_identifier_names
  String get PROGBONUS_TENANT_SECRET;
  // ignore: non_constant_identifier_names
  String get PROGBONUS_API_URL;
}

class AppConfig extends GetxService implements IAppConfig {
  // // ignore: non_constant_identifier_names
  @override
  // ignore: non_constant_identifier_names
  String get PROGBONUS_TENANT_ID => dotenv.env['PROGBONUS_TENANT_ID']!;

  @override
  // ignore: non_constant_identifier_names
  String get PROGBONUS_TENANT_SECRET => dotenv.env['PROGBONUS_TENANT_SECRET']!;

  @override
  // ignore: non_constant_identifier_names
  String get PROGBONUS_API_URL => dotenv.env['PROGBONUS_API_URL']!;

  @override
  Future onReady() async {
    super.onReady();
    log('PROGBONUS_TENANT_ID: $PROGBONUS_TENANT_ID');
    log('PROGBONUS_TENANT_SECRET: $PROGBONUS_TENANT_SECRET');
    log('PROGBONUS_API_URL: $PROGBONUS_API_URL');
  }
}
