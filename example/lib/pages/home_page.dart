import 'package:example/pages/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';
import 'package:speed_up_get/speed_up_get.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer'),
        actions: [
          IconButton(
            onPressed: c.getCustomerData,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Obx(
        () {
          if (c.customer == null) {
            return const Center(
              child: Text('Not found'),
            );
          }

          return Column(
            children: [
              CustomerDetailView(c.customer!),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: c.goToBonuses,
                    child: const Text('Bonuses'),
                  ),
                  ElevatedButton(
                    onPressed: c.goToPurchases,
                    child: const Text('Purchases'),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomerDetailView extends StatelessWidget {
  const CustomerDetailView(this.customer, {Key? key}) : super(key: key);

  final ProgBonusCustomer customer;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _row('Phone', customer.phoneNumber),
          _row('Name', customer.firstName),
          _row('email', customer.email ?? ''),
        ],
      ),
    );
  }

  Widget _row(String title, String value) {
    return Row(
      children: [
        Text(
          title,
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
