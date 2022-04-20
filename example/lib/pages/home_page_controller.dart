import 'package:get/get.dart';
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';

import 'bonuses/bonuses_page.dart';

class HomePageController extends GetxController {
  HomePageController({IProgBonusClient? progBonusClient})
      : _progBonusClient = progBonusClient ?? Get.find();

  final IProgBonusClient _progBonusClient;

  final _customer = Rxn<ProgBonusCustomer>();
  ProgBonusCustomer? get customer => _customer.value;

  @override
  Future onReady() async {
    super.onReady();
    getCustomerData();
  }

  Future getCustomerData() async {
    final res = await _progBonusClient.getCustomer();
    if (res.isFail) {
      _customer(null);
      return;
    }
    _customer(res.value);
  }

  void goToBonuses() {
    //
    Get.to(() => const BonusesPage());
  }

  void goToPurchases() {
    //
    // Get.to(() => const BonusesPage());
  }
}
