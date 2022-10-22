part of 'filters_bloc.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class LoadFilter extends FiltersEvent {
  @override
  List<Object> get props => [];
}

class UpdateCatagoryFilter extends FiltersEvent {
  final Catagoryfilter catagoryfilter;

  const UpdateCatagoryFilter({required this.catagoryfilter});

  @override
  List<Object> get props => [catagoryfilter];
}

class UpdatePriceFilter extends FiltersEvent {
  final Pricefilter pricefilter;

  const UpdatePriceFilter({required this.pricefilter});

  @override
  List<Object> get props => [pricefilter];
}
