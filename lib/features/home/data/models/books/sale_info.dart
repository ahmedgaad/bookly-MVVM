import 'package:bookly/features/home/data/models/books/list_price.dart';
import 'package:equatable/equatable.dart';

class SaleInfo extends Equatable {
  final String? country;
  final String? saleability;
  final bool? isEbook;
  final ListPrice? listPrice;

  const SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
    this.listPrice,
  });

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json['country'] as String?,
        saleability: json['saleability'] as String?,
        isEbook: json['isEbook'] as bool?,
        listPrice: json['listPrice'] == null
            ? null
            : ListPrice.fromJson(json['listPrice']),
      );

  Map<String, dynamic> toJson() => {
        'country': country,
        'saleability': saleability,
        'isEbook': isEbook,
      };

  @override
  List<Object?> get props => [country, saleability, isEbook];
}
