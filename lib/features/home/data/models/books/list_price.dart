import 'package:equatable/equatable.dart';

class ListPrice extends Equatable {
  final double amount;
  final String currencyCode;

  const ListPrice({required this.amount, required this.currencyCode});

  factory ListPrice.fromJson(Map<String, dynamic> json) => ListPrice(
        amount: json['amount'],
        currencyCode: json['currencyCode'],
      );

  @override
  List<Object?> get props => [amount, currencyCode];
}
