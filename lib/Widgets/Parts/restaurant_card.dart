// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Parts/restaurant_tags.dart';

class Restraurant_Card extends StatelessWidget {
  const Restraurant_Card({Key? key, required this.restraurant})
      : super(key: key);
  final Restraurant restraurant;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Restraurant_detail', arguments: restraurant);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    image: DecorationImage(
                      image: NetworkImage(
                        restraurant.imageUrl,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    width: 60,
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${restraurant.deliveryTime} min',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restraurant.name,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  restaurant_Tags(restraurant: restraurant),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    '${restraurant.distance}km - \$${restraurant.deliveryFee} Delivery Fee',
                    style: Theme.of(context).textTheme.headline6,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
