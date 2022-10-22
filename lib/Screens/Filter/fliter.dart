// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/App/blocs/Filters/filters_bloc.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Custom/Drawer/drawer.dart';
import 'package:tokoto/Widgets/Parts/custom_catagory_filter.dart';
import 'package:tokoto/Widgets/Parts/custom_price_filter.dart';

class filter_Screen extends StatelessWidget {
  const filter_Screen({Key? key}) : super(key: key);
  static const String routeName = '/filter_Screen';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const filter_Screen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Custom_Drawer(),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<FiltersBloc, FiltersState>(
              builder: (context, state) {
                if (state is FiltersLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is FiltersLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(),
                      shadowColor: Colors.red,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                    ),
                    onPressed: () {
                      var catagories = state.filters.catagoryFilters
                          .where(
                            (filter) => filter.value,
                          )
                          .map((filter) => filter.catagory.name)
                          .toList();

                      var prices = state.filters.priceFilters
                          .where(
                            (filter) => filter.value,
                          )
                          .map((filter) => filter.price.price)
                          .toList();

                      List<Restraurant> restraurants = Restraurant.restraurant
                          .where(
                            (restraurants) => catagories.any(
                              (catagory) =>
                                  restraurants.tags.contains(catagory),
                            ),
                          )
                          .where(
                            (restraurants) => prices.any(
                              (price) =>
                                  restraurants.priceCatagory.contains(price),
                            ),
                          )
                          .toList();

                      Navigator.pushNamed(context, '/Restraurant_listing', arguments: restraurants);
                    },
                    child: const Text('Apply'),
                  );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('filter_Screen'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
            ),
            const Custom_price_filter(),
            Text(
              'Catagory',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
            ),
            const Custom_catagory_filter(),
          ],
        ),
      ),
    );
  }
}
