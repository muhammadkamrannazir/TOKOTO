// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/catagory_model.dart';
import 'package:tokoto/Model/restraurant_model.dart';

class Catagory_box extends StatelessWidget {
  const Catagory_box({Key? key, required this.catagory}) : super(key: key);
  final Catagory catagory;
  @override
  Widget build(BuildContext context) {
    final List<Restraurant> restraurants = Restraurant.restraurant
        .where((restraurant) => restraurant.tags.contains(catagory.name))
        .toList();
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/Restraurant_listing',
            arguments: restraurants);
      },
      child: Container(
        width: 80,
        margin: const EdgeInsets.only(right: 6),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 12,
              left: 12,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: catagory.image,
                ),
                height: 50,
                width: 60,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
              ),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Text(
                  catagory.name,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
