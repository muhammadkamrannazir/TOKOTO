// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class Custom_searchbar extends StatelessWidget {
  const Custom_searchbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  hintText: 'What would you like to eat?',
                  fillColor: Colors.white,
                  suffixIcon: Icon(
                    Icons.search,
                    color: Theme.of(context).primaryColor,
                  ),
                  contentPadding:
                      const EdgeInsets.only(left: 20, bottom: 6, top: 12),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: Theme.of(context).primaryColor,
                    ),
                  )),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 50,
            height: 50,
            child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/filter_Screen');
              },
              icon: const Icon(Icons.menu),
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
    );
  }
}
