// ignore_for_file: camel_case_types
import 'package:flutter/material.dart';
import 'package:tokoto/Model/catagory_model.dart';
import 'package:tokoto/Model/promo_card_models.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Widgets/Custom/Drawer/drawer.dart';
import 'package:tokoto/Widgets/Custom/custom_home_appbar.dart';
import 'package:tokoto/Widgets/Custom/custom_searchbar.dart';
import 'package:tokoto/Widgets/Parts/catagory_box.dart';
import 'package:tokoto/Widgets/Parts/promo_box.dart';
import 'package:tokoto/Widgets/Parts/restaurant_card.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({Key? key}) : super(key: key);
  static const String routeName = '/home';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const Home_Screen(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_home_appbar(),
      drawer: const Custom_Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Catagory.catagories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Catagory_box(
                      catagory: Catagory.catagories[index],
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding:  const EdgeInsets.all(10.0),
              child: SizedBox(
                height: 145,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: Promo.promo.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Promo_box(
                      promo: Promo.promo[index],
                    );
                  },
                ),
              ),
            ),
            const Custom_searchbar(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Rated',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Restraurant.restraurant.length,
              itemBuilder: (BuildContext context, int index) {
                return Restraurant_Card(
                  restraurant: Restraurant.restraurant[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
