import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tokoto/Model/catagoryfilter_model.dart';
import 'package:tokoto/Model/filter_model.dart';
import 'package:tokoto/Model/price_filter_model.dart';

part 'filters_event.dart';
part 'filters_state.dart';

class FiltersBloc extends Bloc<FiltersEvent, FiltersState> {
  FiltersBloc() : super(FiltersLoading()) {
    on<LoadFilter>(_onLoadFilter);
    on<UpdateCatagoryFilter>(_onUpdateCatagoryFilter);
    on<UpdatePriceFilter>(_onUpdatePriceFilter);
  }

  void _onLoadFilter(
    LoadFilter event,
    Emitter<FiltersState> emit,
  ) {
    emit(
      FiltersLoaded(
        filters: Filters(
          catagoryFilters: Catagoryfilter.filters,
          priceFilters: Pricefilter.filters,
        ),
      ),
    );
  }

  void _onUpdateCatagoryFilter(
    UpdateCatagoryFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<Catagoryfilter> updatedCatagoryFilters =
          state.filters.catagoryFilters.map(
        (catagoryFilter) {
          return catagoryFilter.id == event.catagoryfilter.id
              ? event.catagoryfilter
              : catagoryFilter;
        },
      ).toList();
      emit(
        FiltersLoaded(
          filters: Filters(
            catagoryFilters: updatedCatagoryFilters,
            priceFilters: state.filters.priceFilters,
          ),
        ),
      );
    }
  }

  void _onUpdatePriceFilter(
    UpdatePriceFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<Pricefilter> updatedPriceFilter =
          state.filters.priceFilters.map(
        (pricefilter) {
          return pricefilter.id == event.pricefilter.id
              ? event.pricefilter
              : pricefilter;
        },
      ).toList();
       emit(
        FiltersLoaded(
          filters: Filters(
            catagoryFilters: state.filters.catagoryFilters,
            priceFilters: updatedPriceFilter,
          ),
        ),
      );
    }
  }
}
