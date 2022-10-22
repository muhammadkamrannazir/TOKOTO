import 'package:equatable/equatable.dart';
import 'package:tokoto/Model/price_model.dart';

class Pricefilter extends Equatable {
  final int id;
  final Price price;
  final bool value;

  const Pricefilter(
      {required this.id, required this.price, required this.value});

  Pricefilter copyWith({
    int? id,
    Price? price,
    bool? value,
  }) {
    return Pricefilter(
        id: id ?? this.id,
        price: price ?? this.price,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props => [id, price, value];

  static List<Pricefilter> filters = Price.prices
      .map((price) => Pricefilter(id: price.id, price: price, value: false))
      .toList();
}
