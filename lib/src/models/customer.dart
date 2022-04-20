import 'package:equatable/equatable.dart';

class ProgBonusCustomer extends Equatable {
  const ProgBonusCustomer({
    required this.phoneNumber,
    required this.cardNumber,
    required this.firstName,
    this.email,
    this.lastName,
  });

  final String phoneNumber;
  final String cardNumber;
  final String firstName;
  final String? lastName;
  final String? email;

  @override
  List<Object?> get props => [
        phoneNumber,
        cardNumber,
        firstName,
      ];

  static ProgBonusCustomer? fromJson(Map<String, dynamic> json) {
    return ProgBonusCustomer(
      phoneNumber: json['phoneNumber']?.toString() ?? '',
      cardNumber: json['cardNumber']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      firstName: json['firstName']?.toString() ?? '',
      lastName: json['lastName']?.toString() ?? '',
    );
  }
}
