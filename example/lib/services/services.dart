import 'package:get/get.dart';
import 'package:progbonus/progbonus.dart';

Future initServices() async {
  Get.put<IProgBonusClient>(ProgBonusClient(
    baseUrl: 'https://appsapi.bonusgroups.ru',
    getAccessToken: () => '',
  ));
}
