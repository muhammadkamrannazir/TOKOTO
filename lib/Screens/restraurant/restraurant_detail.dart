// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Parts/restaurant_info.dart';

import '../../App/blocs/Basket/basket_bloc.dart';

class Restraurant_detail extends StatelessWidget {
  const Restraurant_detail({Key? key, required this.restraurant})
      : super(key: key);
  static const String routeName = '/Restraurant_detail';
  static Route route({required Restraurant restraurant}) {
    return MaterialPageRoute(
        builder: (_) => Restraurant_detail(restraurant: restraurant),
        settings: const RouteSettings(name: routeName));
  }

  final Restraurant restraurant;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(),
                  shadowColor: Colors.red,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/basket_screen');
                },
                child: const Text('Basket'),
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 255,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50)),
                  color: Colors.white,
                  image: DecorationImage(
                    image: NetworkImage(
                      restraurant.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Restaurant_info(restraurant: restraurant),
              ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: restraurant.tags.length,
                itemBuilder: (context, index) {
                  return _BuiltMenuItems(restraurant, context, index);
                },
              ),
            ],
          ),
        ));
  }

  Widget _BuiltMenuItems(
      Restraurant restraurant, BuildContext context, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
          child: Text(
            restraurant.tags[index],
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Colors.red),
          ),
        ),
        Column(
            children: restraurant.menuItems
                .where(
                    (MenuItem) => MenuItem.catagory == restraurant.tags[index])
                .map((MenuItem) => Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: ListTile(
                            dense: true,
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              MenuItem.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.black),
                            ),
                            subtitle: Text(
                              MenuItem.description,
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.black),
                            ),
                            trailing: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '\$${MenuItem.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6!
                                      .copyWith(color: Colors.black),
                                ),
                                BlocBuilder<BasketBloc, BasketState>(
                                  builder: (context, state) {
                                    return IconButton(
                                      onPressed: () {
                                        context
                                            .read<BasketBloc>()
                                            .add(AddItem(MenuItem),);
                                      },
                                      icon: const Icon(
                                        Icons.add_circle,
                                        color: Colors.black,
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          height: 2,
                        ),
                      ],
                    ))
                .toList())
      ],
    );
  }
}
