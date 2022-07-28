class ProgBonusBonus {
  List<Bonuses>? _bonuses;
  double? _totalAmount;
  double? _actualTotalAmount;
  List<Types>? _types;

  ProgBonusBonus({
    List<Bonuses> bonuses = const [],
    double? totalAmount,
    double? actualTotalAmount,
    List<Types>? types,
  }) {
    _bonuses = bonuses;
    if (totalAmount != null) {
      _totalAmount = totalAmount;
    }
    if (actualTotalAmount != null) {
      _actualTotalAmount = actualTotalAmount;
    }
    if (types != null) {
      _types = types;
    }
  }

  List<Bonuses> get bonuses => _bonuses ?? [];
  set bonuses(List<Bonuses>? bonuses) => _bonuses = bonuses;

  double get totalAmount => _totalAmount ?? 0;
  set totalAmount(double? totalAmount) => _totalAmount = totalAmount;

  double get actualTotalAmount => _actualTotalAmount ?? 0;
  set actualTotalAmount(double? actualTotalAmount) =>
      _actualTotalAmount = actualTotalAmount;

  double get used => (totalAmount - actualTotalAmount).toDouble();

  List<Types>? get types => _types;
  set types(List<Types>? types) => _types = types;

  ProgBonusBonus.fromJson(Map<String, dynamic> json) {
    if (json['bonuses'] != null) {
      _bonuses = <Bonuses>[];
      json['bonuses'].forEach((v) {
        _bonuses!.add(Bonuses.fromJson(v));
      });
    }
    _totalAmount = double.tryParse(json['totalAmount']?.toString() ?? '') ?? 0;
    _actualTotalAmount =
        double.tryParse(json['actualTotalAmount']?.toString() ?? '') ?? 0;

    if (json['types'] != null) {
      _types = <Types>[];
      json['types'].forEach((v) {
        _types!.add(Types.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_bonuses != null) {
      data['bonuses'] = _bonuses!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = _totalAmount;
    data['actualTotalAmount'] = _actualTotalAmount;
    if (_types != null) {
      data['types'] = _types!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Bonuses {
  int? _id;
  double? _amount;
  double? _used;
  double? _actualAmount;
  String? _start;
  String? _end;
  int? _daysLeft;
  bool? _expired;
  String? _type;

  Bonuses(
      {int? id,
      double? amount,
      double? used,
      double? actualAmount,
      String? start,
      String? end,
      int? daysLeft,
      bool? expired,
      String? type}) {
    if (id != null) {
      _id = id;
    }
    if (amount != null) {
      _amount = amount;
    }
    if (used != null) {
      _used = used;
    }
    if (actualAmount != null) {
      _actualAmount = actualAmount;
    }
    if (start != null) {
      _start = start;
    }
    if (end != null) {
      _end = end;
    }
    if (daysLeft != null) {
      _daysLeft = daysLeft;
    }
    if (expired != null) {
      _expired = expired;
    }
    if (type != null) {
      _type = type;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  double? get amount => _amount;
  set amount(double? amount) => _amount = amount;
  double? get used => _used;
  set used(double? used) => _used = used;
  double? get actualAmount => _actualAmount;
  set actualAmount(double? actualAmount) => _actualAmount = actualAmount;
  String? get start => _start;
  set start(String? start) => _start = start;
  String? get end => _end;
  set end(String? end) => _end = end;
  int? get daysLeft => _daysLeft;
  set daysLeft(int? daysLeft) => _daysLeft = daysLeft;
  bool? get expired => _expired;
  set expired(bool? expired) => _expired = expired;
  String? get type => _type;
  set type(String? type) => _type = type;

  Bonuses.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _amount = double.tryParse(json['amount']?.toString() ?? '') ?? 0;
    _used = double.tryParse(json['used']?.toString() ?? '') ?? 0;
    _actualAmount =
        double.tryParse(json['actualAmount']?.toString() ?? '') ?? 0;
    _start = json['start'];
    _end = json['end'];
    _daysLeft = json['daysLeft'];
    _expired = json['expired'];
    _type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['amount'] = _amount;
    data['used'] = _used;
    data['actualAmount'] = _actualAmount;
    data['start'] = _start;
    data['end'] = _end;
    data['daysLeft'] = _daysLeft;
    data['expired'] = _expired;
    data['type'] = _type;
    return data;
  }
}

class Types {
  String? _type;
  double? _amount;

  Types({String? type, double? amount}) {
    if (type != null) {
      _type = type;
    }
    if (amount != null) {
      _amount = amount;
    }
  }

  String? get type => _type;
  set type(String? type) => _type = type;
  double? get amount => _amount;
  set amount(double? amount) => _amount = amount;

  Types.fromJson(Map<String, dynamic> json) {
    _type = json['type'];
    _amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = _type;
    data['amount'] = _amount;
    return data;
  }
}
