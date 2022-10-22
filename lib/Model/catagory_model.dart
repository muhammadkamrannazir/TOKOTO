import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class Catagory extends Equatable {
  final int id;
  final String name;
  final Image image;

  const Catagory({
    required this.name,
    required this.image,
    required this.id,
  });

  @override
  List<Object?> get props => [id, image, name];

  static List<Catagory> catagories = [
    Catagory(
      name: 'Pizza',
      image: Image.asset('assets/pizza.png'),
      id: 1,
    ),
    Catagory(
      name: 'Burger',
      image: Image.asset('assets/abrar.png'),
      id: 2,
    ),
    Catagory(
      name: 'Salad',
      image: Image.asset('assets/salad.png'),
      id: 3,
    ),
    Catagory(
      name: 'Desserts',
      image: Image.asset('assets/dessert.png'),
      id: 4,
    ),
    Catagory(
      name: 'Drinks',
      image: Image.asset('assets/drinks.png'),
      id: 5,
    ),
  ];
}
