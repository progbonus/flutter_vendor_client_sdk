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

  /// JWT Authorization
  Get.lazyPut<IProgBonusClient>(
    () => ProgBonusClient(
      baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
      tenantId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
      authType: JwtAuthType(
        () => Get.find<AuthService>()
            .idToken, // FirebaseAuth.instance.accessToken
      ),
    ),
  );

  Get.lazyPut<IProgBonusClient>(
    () => ProgBonusClient(
      baseUrl: Get.find<IAppConfig>().PROGBONUS_API_URL,
      tenantId: Get.find<IAppConfig>().PROGBONUS_TENANT_ID,
      authType: SecretAuthType(
        secret: Get.find<IAppConfig>().PROGBONUS_TENANT_SECRET,
        ts: () {
          // return 'some secret string';
          return DateTime.now().toIso8601String();
        },
      ),
    ),
  );
}
