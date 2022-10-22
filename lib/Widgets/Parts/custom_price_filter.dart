// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/App/blocs/Filters/filters_bloc.dart';

class Custom_price_filter extends StatelessWidget {
  const Custom_price_filter({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FiltersBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return const CircularProgressIndicator();
        }
        if (state is FiltersLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filters.priceFilters
                .asMap()
                .entries
                .map(
                  (price) => InkWell(
                    onTap: () {
                      context.read<FiltersBloc>().add(
                            UpdatePriceFilter(
                              pricefilter: state.filters.priceFilters[price.key]
                                  .copyWith(
                                value: !state
                                    .filters.priceFilters[price.key].value,
                              ),
                            ),
                          );
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                      decoration: BoxDecoration(
                        color: state.filters.priceFilters[price.key].value
                            ? Colors.red.withAlpha(100)
                            : Colors.white,
                      ),
                      child: Text(
                        state.filters.priceFilters[price.key].price.price,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Text('SomeThing went wrong');
        }
      },
    );
  }
}
