part of 'filters_bloc.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FiltersLoading extends FiltersState {}

class FiltersLoaded extends FiltersState {
  final Filters filters;
  const FiltersLoaded({
    this.filters = const Filters(),
  });

  @override
  List<Object> get props => [filters];
}
