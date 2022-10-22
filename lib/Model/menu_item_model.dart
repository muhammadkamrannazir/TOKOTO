import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restraurantId;
  final String name;
  final String description;
  final String catagory;
  final double price;

  const MenuItem({
    required this.catagory,
    required this.id,
    required this.restraurantId,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  List<Object?> get props => [id, restraurantId, name, description, price, catagory];

  static List<MenuItem> menuItems = [
    const MenuItem(
      id: 1,
      restraurantId: 1,
      catagory: 'Drinks',
      name: 'Coca Cola',
      description: 'Awsome Pizza with tomatos and olives',
      price: 20.9,
    ),
    const MenuItem(
      id: 1,
      restraurantId: 1,
      catagory: 'Drinks',
      name: 'Fanta',
      description: 'Awsome Pizza with tomatos and olives',
      price: 20.9,
    ),
    const MenuItem(
      catagory: 'Pizza',
      id: 1,
      restraurantId: 1,
      name: 'Fagita ',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 10.9,
    ),
    const MenuItem(
      catagory: 'Burger',
      id: 1,
      restraurantId: 1,
      name: 'Patty Burger ',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 15.9,
    ),
    const MenuItem(
      catagory: 'Desserts',
      id: 1,
      restraurantId: 1,
      name: 'Cake',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 35.9,
    ),
    const MenuItem(
      catagory: 'Salad',
      id: 1,
      restraurantId: 1,
      name: 'Russian Salad',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 15.2,
    ),
    const MenuItem(
      catagory: 'Burger',
      id: 1,
      restraurantId: 2,
      name: 'Big Mac',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 15.2,
    ),
    const MenuItem(
      catagory: 'Desserts',
      id: 1,
      restraurantId: 2,
      name: 'Cup Cake',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 5.2,
    ),
    const MenuItem(
      catagory: 'Drinks',
      id: 1,
      restraurantId: 2,
      name: 'Mineral Water',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 5.2,
    ),
    const MenuItem(
      catagory: 'Pizza',
      id: 1,
      restraurantId: 4,
      name: 'Kabab Stuffer',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 15.2,
    ),
    const MenuItem(
      catagory: 'Burger',
      id: 1,
      restraurantId: 4,
      name: 'Tornado Crunch',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 15.2,
    ),
     const MenuItem(
      catagory: 'Pizza',
      id: 1,
      restraurantId: 3,
      name: 'Special Pizza',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 105.2,
    ),
    const MenuItem(
      catagory: 'Salad',
      id: 1,
      restraurantId: 3,
      name: 'Beans Special',
      description: 'Awsome Cold Drinks with Ice cubes',
      price: 111.2,
    ),
  ];
}
