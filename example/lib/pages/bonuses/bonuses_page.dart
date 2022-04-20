import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progbonus_vendor_client/progbonus_vendor_client.dart';
import 'package:speed_up_flutter/speed_up_flutter.dart';

class BonusesPage extends StatefulWidget {
  const BonusesPage({Key? key}) : super(key: key);

  @override
  State<BonusesPage> createState() => _BonusesPageState();
}

class _BonusesPageState extends State<BonusesPage> {
  @override
  void initState() {
    super.initState();
    _fetchBonusInfo();
  }

  ProgBonusBonus? _bonus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bonuses'),
        actions: [
          IconButton(
            onPressed: _fetchBonusInfo,
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: _bonus == null
          ? const SizedBox.shrink()
          : Column(
              children: [
                BonusStatView(_bonus!),
                Expanded(
                  child: BonusListView(_bonus!),
                ),
              ],
            ),
    );
  }

  Future _fetchBonusInfo() async {
    //
    final bonusInfo = await Get.find<IProgBonusClient>().getBonuses();
    setState(() {
      if (bonusInfo.isFail) {
        _bonus = null;
      }
      _bonus = bonusInfo.value;
    });
  }
}

class BonusStatView extends StatelessWidget {
  const BonusStatView(this.bonus, {Key? key}) : super(key: key);

  final ProgBonusBonus bonus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            '${bonus.actualTotalAmount}/${bonus.totalAmount}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32,
            ),
          ),
          Text('Used: ${(bonus.used).toStringAsFixed(2)}'),
        ],
      ),
    );
  }
}

class BonusListView extends StatelessWidget {
  const BonusListView(this.bonus, {Key? key}) : super(key: key);

  final ProgBonusBonus bonus;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: bonus.bonuses.length,
      itemBuilder: ((context, index) => BonusListItemView(
            bonus.bonuses[index],
          )),
      separatorBuilder: (_, __) => 10.h,
    );
  }
}

class BonusListItemView extends StatelessWidget {
  const BonusListItemView(this.bonus, {Key? key}) : super(key: key);

  final Bonuses bonus;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(bonus.type ?? ''),
          Text('${bonus.actualAmount}/${bonus.amount}'),
          Text('${bonus.used}'),
        ],
      ),
    );
  }
}
