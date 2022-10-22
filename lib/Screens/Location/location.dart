// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokoto/controller/controller.dart';

class Location extends StatelessWidget {
  Location({Key? key}) : super(key: key);
  static const String routeName = '/location';
  static Route route() {
    return MaterialPageRoute(
        builder: (_) => Location(),
        settings: const RouteSettings(name: routeName));
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final Control _controller = Get.put(Control());
  @override
  Widget build(BuildContext context) {
    //-------------------------city
    final cityFeild = TextFormField(
      autofocus: false,
      controller: cityController,
      validator: (city) {
        if (city!.isEmpty) {
          return ("Please Enter City");
        }
        return null;
      },
      onChanged: (city) {
        _controller.city.value = city;
      },
      onSaved: (city) {
        cityController.text = city!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.place,
            color: Colors.red,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "City",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //----------------------------Address
    final addressfeild = TextFormField(
      autofocus: false,
      controller: addressController,
      validator: (address) {
        if (address!.isEmpty) {
          return ("Please Enter Address");
        }
        return null;
      },
      onChanged: (address) {
        _controller.address.value = address;
      },
      onSaved: (address) {
        cityController.text = address!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.place,
            color: Colors.red,
          ),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
    //--------------------------------Button
    final loginbutton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Colors.red,
      child: MaterialButton(
        splashColor: Colors.black,
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.pushNamed(context, '/home');
          }
        },
        child: const Text(
          "Add Location",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 200,
                        child: Image.asset(
                          "assets/map.png",
                          width: 220,
                        )),
                    const SizedBox(
                      height: 25,
                    ),
                    cityFeild,
                    const SizedBox(
                      height: 25,
                    ),
                    addressfeild,
                    const SizedBox(
                      height: 30,
                    ),
                    loginbutton,
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
