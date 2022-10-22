// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Parts/restaurant_card.dart';

class Restraurant_listing extends StatelessWidget {
  const Restraurant_listing({Key? key, required this.restraurants})
      : super(key: key);
  static const String routeName = '/Restraurant_listing';
  static Route route({required List<Restraurant> restraurants}) {
    return MaterialPageRoute(
        builder: (_) => Restraurant_listing(restraurants: restraurants),
        settings: const RouteSettings(name: routeName));
  }

  final List<Restraurant> restraurants;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restraurants'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: restraurants.length,
          itemBuilder: (BuildContext context, int index) {
            return Restraurant_Card(restraurant: restraurants[index]);
          },
        ),
      ),
    );
  }
}
