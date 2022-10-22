// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/App/blocs/Basket/basket_bloc.dart';
import 'package:tokoto/Widgets/Custom/Drawer/drawer.dart';

class Edit_screen extends StatelessWidget {
  const Edit_screen({Key? key}) : super(key: key);
  static const String routeName = '/Edit_screen';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const Edit_screen(),
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
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: const RoundedRectangleBorder(),
                shadowColor: Colors.red,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text('Done'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Edit Basket'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
            ),
            BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state is BasketLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  );
                } else if (state is BasketLoaded) {
                  return state.basket.items.isEmpty
                      ? Container(
                          margin: const EdgeInsets.only(top: 5),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 10),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Text(
                                'No Item in Basket',
                                style: Theme.of(context).textTheme.headline6,
                                textAlign: TextAlign.left,
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            children: [
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: state.basket
                                    .itemQuantity(state.basket.items)
                                    .keys
                                    .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.only(top: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 5),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.red),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                        ),
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(RemoveAllItem(state.basket.itemQuantity(state.basket.items).keys.elementAt(index)));
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                          ),
                                        ),
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(RemoveItem(state.basket.itemQuantity(state.basket.items).keys.elementAt(index)));
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle,
                                          ),
                                        ),
                                        IconButton(
                                          visualDensity: VisualDensity.compact,
                                          onPressed: () {
                                            context.read<BasketBloc>().add(AddItem(state.basket.itemQuantity(state.basket.items).keys.elementAt(index)));
                                          },
                                          icon: const Icon(
                                            Icons.add_circle,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                } else {
                  return const Text('Something went wrong');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
