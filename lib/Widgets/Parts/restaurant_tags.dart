// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/restraurant_model.dart';

class restaurant_Tags extends StatelessWidget {
  const restaurant_Tags({
    Key? key,
    required this.restraurant,
  }) : super(key: key);

  final Restraurant restraurant;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: restraurant.tags
          .map((tag) =>
              restraurant.tags.indexOf(tag) == restraurant.tags.length - 1
                  ? Text(
                      tag,
                      style: Theme.of(context).textTheme.headline6,
                    )
                  : Text(
                      '$tag, ',
                      style: Theme.of(context).textTheme.headline6,
                    ))
          .toList(),
    );
  }
}
