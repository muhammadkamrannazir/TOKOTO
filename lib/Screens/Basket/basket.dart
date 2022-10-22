// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tokoto/Widgets/Custom/Drawer/drawer.dart';

import '../../App/blocs/Basket/basket_bloc.dart';

class basket_screen extends StatelessWidget {
  const basket_screen({Key? key}) : super(key: key);
  static const String routeName = '/basket_screen';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const basket_screen(),
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
                Navigator.pushNamed(context, '/Checkout');
              },
              child: const Text('Order'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title:  const Text('basket_screen'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/Edit_screen');
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.all(22.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cutlery',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      color: Colors.red,
                    ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 25),
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Do you need cutlery?',
                        style: Theme.of(context).textTheme.headline6,
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
                          return SizedBox(
                            width: 100,
                            child: SwitchListTile(
                              value: state.basket.cutlery,
                              dense: false,
                              onChanged: (bool? newValue) {
                                context
                                    .read<BasketBloc>()
                                    .add(const ToggleSwitch());
                              },
                            ),
                          );
                        } else {
                          return const Text('Something gone wrong');
                        }
                      },
                    )
                  ],
                ),
              ),
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
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: const AlwaysScrollableScrollPhysics(),
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
                                        style:
                                            Theme.of(context).textTheme.headline6,
                                      ),
                                    ),
                                    Text(
                                      '\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                  } else {
                    return const Text('Something went wrong');
                  }
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/truck.png",
                      height: 85,
                      width: 90,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Delivery in 20 minutes',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 5),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                width: double.infinity,
                height: 100,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Do you have any voucher?',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/Voucher');
                          },
                          child: Text(
                            'Apply',
                            style:
                                Theme.of(context).textTheme.headline6!.copyWith(
                                      color: Colors.red,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      "assets/voucher.png",
                      height: 85,
                      width: 90,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 7),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                width: double.infinity,
                height: 100,
                child: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    if (state is BasketLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.red,
                        ),
                      );
                    } else if (state is BasketLoaded) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SubTotal',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                '\$${state.basket.subtotalString}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Fee',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Text(
                                '\$10',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(
                                      color: Colors.red,
                                    ),
                              ),
                              Text(
                                '\$${state.basket.totalString}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5!
                                    .copyWith(color: Colors.red),
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const Text('Something Wrong');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
