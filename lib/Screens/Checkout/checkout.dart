// ignore_for_file: camel_case_types

import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tokoto/Screens/Home/home.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key}) : super(key: key);
  static const String routeName = '/Checkout';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => const Checkout(),
        settings: const RouteSettings(name: routeName));
  }

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late ConfettiController _controllerTopCenter;
  @override
  void initState() {
    super.initState();
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    Timer(
      const Duration(seconds: 10),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home_Screen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ConfettiWidget(
                confettiController: _controllerTopCenter,
                particleDrag: 0.05,
                emissionFrequency: 0.05,
                numberOfParticles: 20,
                gravity: 0.05,
                shouldLoop: false,
                colors: const [Colors.green, Colors.blue, Colors.pink],
              ),
            ),
            Image.asset(
              'assets/tick.png',
              height: 150,
              width: 180,
            ),
             const SizedBox(
              height: 10,
            ),
            Text(
              'Order placed',
              style: Theme.of(context).textTheme.headline1!.copyWith(
                    color: Colors.red,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
