import 'package:example/config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';

import 'auth_service.dart';

export './auth_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future initServices() async {
  await Firebase.initializeApp();

  await dotenv.load(fileName: 'assets/.env');
  Get.put<IAppConfig>(AppConfig());

  Get.put(AuthService());

  Get.lazyPut<IProgBonusClient>(
    () => ProgBonusClient(
      baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
      tenantsId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
      secret: Get.find<IAppConfig>().PROGBONUS_TENANT_SECRET,
      getAccessToken: () {
        final accessToken = Get.find<AuthService>().idToken;
        return accessToken;
      },
    ),
  );
}
