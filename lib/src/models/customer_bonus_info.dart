import 'package:equatable/equatable.dart';

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
    if (bonuses != null) {
      this._bonuses = bonuses;
    }
    if (totalAmount != null) {
      this._totalAmount = totalAmount;
    }
    if (actualTotalAmount != null) {
      this._actualTotalAmount = actualTotalAmount;
    }
    if (types != null) {
      this._types = types;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this._bonuses != null) {
      data['bonuses'] = this._bonuses!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this._totalAmount;
    data['actualTotalAmount'] = this._actualTotalAmount;
    if (this._types != null) {
      data['types'] = this._types!.map((v) => v.toJson()).toList();
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
  Null? _end;
  int? _daysLeft;
  bool? _expired;
  String? _type;

  Bonuses(
      {int? id,
      double? amount,
      double? used,
      double? actualAmount,
      String? start,
      Null? end,
      int? daysLeft,
      bool? expired,
      String? type}) {
    if (id != null) {
      this._id = id;
    }
    if (amount != null) {
      this._amount = amount;
    }
    if (used != null) {
      this._used = used;
    }
    if (actualAmount != null) {
      this._actualAmount = actualAmount;
    }
    if (start != null) {
      this._start = start;
    }
    if (end != null) {
      this._end = end;
    }
    if (daysLeft != null) {
      this._daysLeft = daysLeft;
    }
    if (expired != null) {
      this._expired = expired;
    }
    if (type != null) {
      this._type = type;
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
  Null? get end => _end;
  set end(Null? end) => _end = end;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this._id;
    data['amount'] = this._amount;
    data['used'] = this._used;
    data['actualAmount'] = this._actualAmount;
    data['start'] = this._start;
    data['end'] = this._end;
    data['daysLeft'] = this._daysLeft;
    data['expired'] = this._expired;
    data['type'] = this._type;
    return data;
  }
}

class Types {
  String? _type;
  double? _amount;

  Types({String? type, double? amount}) {
    if (type != null) {
      this._type = type;
    }
    if (amount != null) {
      this._amount = amount;
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
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = this._type;
    data['amount'] = this._amount;
    return data;
  }
}
