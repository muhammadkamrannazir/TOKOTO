// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:tokoto/Model/voucher_model.dart';
import 'package:tokoto/Widgets/Custom/Drawer/drawer.dart';

class Voucher_screen extends StatelessWidget {
  const Voucher_screen({Key? key}) : super(key: key);
  static const String routeName = '/Voucher';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const Voucher_screen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Custom_Drawer(),
      appBar: AppBar(
        title: const Text('Voucher'),
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
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Enter Voucher Code",
              style: Theme.of(context)
                  .textTheme
                  .headline2!
                  .copyWith(color: Colors.red),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Voucher Code',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Your Vouncher',
              style: Theme.of(context).textTheme.headline3!.copyWith(
                    color: Colors.red,
                  ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: Voucher.vouchers.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 10, bottom: 10),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '3x',
                        style: Theme.of(context).textTheme.headline5!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Text(
                              Voucher.vouchers[index].code,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Apply',
                          style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                    color: Colors.red,
                                  ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
