// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/App/blocs/Filters/filters_bloc.dart';

class Custom_catagory_filter extends StatelessWidget {
  const Custom_catagory_filter({
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
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.filters.catagoryFilters.length,
            itemBuilder: (context, index) {
              return Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 33, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      state.filters.catagoryFilters[index].catagory.name,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                    SizedBox(
                      height: 25,
                      child: Checkbox(
                        value: state.filters.catagoryFilters[index].value,
                        onChanged: (bool? newValue) {
                          context.read<FiltersBloc>().add(
                                UpdateCatagoryFilter(
                                  catagoryfilter: state
                                      .filters.catagoryFilters[index]
                                      .copyWith(
                                        value: !state.filters.catagoryFilters[index].value,
                                      ),
                                ),
                              );
                        },
                      ),
                    )
                  ],
                ),
              );
            },
          );
        } else {
          return const Text('SomeThing went wrong');
        }
      },
    );
  }
}
