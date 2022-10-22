import 'package:equatable/equatable.dart';
import 'package:tokoto/Model/catagoryfilter_model.dart';
import 'package:tokoto/Model/price_filter_model.dart';

class Filters extends Equatable {
  final List<Catagoryfilter> catagoryFilters;
  final List<Pricefilter> priceFilters;

  const Filters({
    this.catagoryFilters = const <Catagoryfilter>[],
    this.priceFilters = const <Pricefilter>[],
  });

  Filters copyWith({
    List<Catagoryfilter>? catagoryFilters,
    List<Pricefilter>? priceFilters,
  }) {
    return Filters(catagoryFilters: catagoryFilters ?? this.catagoryFilters, priceFilters: priceFilters?? this.priceFilters);
  }

  @override
  List<Object?> get props =>[catagoryFilters, priceFilters];
}
