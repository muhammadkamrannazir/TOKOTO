// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Parts/restaurant_tags.dart';

class Restaurant_info extends StatelessWidget {
  const Restaurant_info({Key? key, required this.restraurant})
      : super(key: key);
  final Restraurant restraurant;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restraurant.name,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Colors.red,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          restaurant_Tags(restraurant: restraurant),
          const SizedBox(
            height: 6,
          ),
          Text(
            '${restraurant.distance}km away - \$${restraurant.deliveryFee} Delivery Fee',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.red,
                ),
          ),
          const SizedBox(
            height: 6,
          ),
          Text(
            'simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the simply dummy text of the printing and typesetting industry.',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  color: Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
