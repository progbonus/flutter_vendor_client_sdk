import 'package:get/get.dart';
import 'package:progbonus/progbonus.dart';

class HomePageController extends GetxController {
  HomePageController({IProgBonusClient? progBonusClient})
      : _progBonusClient = progBonusClient ?? Get.find();

  final IProgBonusClient _progBonusClient;
}
