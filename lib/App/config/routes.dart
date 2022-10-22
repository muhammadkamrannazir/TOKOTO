// ignore_for_file: avoid_print,
import 'package:flutter/material.dart';
import 'package:tokoto/Model/restraurant_model.dart';
import 'package:tokoto/Screens/Basket/basket.dart';
import 'package:tokoto/Screens/Basket/edit_basket.dart';
import 'package:tokoto/Screens/Checkout/checkout.dart';
import 'package:tokoto/Screens/Filter/fliter.dart';
import 'package:tokoto/Screens/Home/home.dart';
import 'package:tokoto/Screens/Location/location.dart';
import 'package:tokoto/Screens/restraurant/restraurant_detail.dart';
import 'package:tokoto/Screens/restraurant/restraurant_listing.dart';
import 'package:tokoto/Screens/voucher/voucher.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print("The route is ${settings.name}");
    switch (settings.name) {
      case Home_Screen.routeName://1
        return Home_Screen.route();
      case Location.routeName: //2
        return Location.route();
      case basket_screen.routeName: //3
        return basket_screen.route();
      case Edit_screen.routeName: //4
        return Edit_screen.route();
      case Checkout.routeName: //5
        return Checkout.route();
      case filter_Screen.routeName: //6
        return filter_Screen.route();
      case Restraurant_detail.routeName: //7
        return Restraurant_detail.route(
          restraurant: settings.arguments as Restraurant
        );
      case Restraurant_listing.routeName: //8
        return Restraurant_listing.route(
          restraurants: settings.arguments as List<Restraurant>
        );
      case Voucher_screen.routeName: //9
        return Voucher_screen.route();
      default: //10
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text("ERROR"),
              ),
            ),
        settings: const RouteSettings(name: '/error'));
  }
}
