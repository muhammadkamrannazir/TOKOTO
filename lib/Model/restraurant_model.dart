// ignore_for_file: must_be_immutable, non_constant_identifier_names, avoid_types_as_parameter_names
import 'package:equatable/equatable.dart';
import 'package:tokoto/Model/menu_item_model.dart';

class Restraurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final String priceCatagory;
  final double deliveryFee;
  final double distance;

  const Restraurant({
    required this.menuItems,
    required this.priceCatagory,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        menuItems,
        name,
        tags,
        deliveryTime,
        priceCatagory,
        deliveryFee,
        distance,
      ];

  static List<Restraurant> restraurant = [
    Restraurant(
      priceCatagory: '\$\$\$',
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 1)
          .toList(),
      id: 1,
      imageUrl:
          'https://media.istockphoto.com/photos/modern-restaurant-interior-design-picture-id1211547141?k=20&m=1211547141&s=612x612&w=0&h=KiZX3NBZVCK4MlSh4BJ8hZNSJcTIMbNSSV2yusw2NmM=',
      name: 'Garvish Hotel',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 1)
          .map((MenuItem) => MenuItem.catagory)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 10.0,
      distance: 0.5,
    ),
    Restraurant(
      priceCatagory: '\$\$\$',
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 1)
          .toList(),
      id: 1,
      imageUrl:
          'https://media.istockphoto.com/photos/modern-restaurant-interior-design-picture-id1211547141?k=20&m=1211547141&s=612x612&w=0&h=KiZX3NBZVCK4MlSh4BJ8hZNSJcTIMbNSSV2yusw2NmM=',
      name: 'Happy Hotel',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 1)
          .map((MenuItem) => MenuItem.catagory)
          .toSet()
          .toList(),
      deliveryTime: 10,
      deliveryFee: 10.0,
      distance: 1.5,
    ),
    Restraurant(
      priceCatagory: '\$\$',
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 2)
          .toList(),
      id: 2,
      imageUrl: 'https://www.businesslist.pk/img/cats/restaurants.jpg',
      name: 'Usmania Hotel',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 2)
          .map((MenuItem) => MenuItem.catagory)
          .toSet()
          .toList(),
      deliveryTime: 50,
      deliveryFee: 20.0,
      distance: 1.5,
    ),
    Restraurant(
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 3)
          .toList(),
      id: 3,
      priceCatagory: '\$',
      imageUrl:
          'https://i2.wp.com/www.itssouthasian.com/wp-content/uploads/2020/10/restaurants.jpg',
      name: 'Al Aziz Hotel',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 3)
          .map((MenuItem) => MenuItem.catagory)
          .toSet()
          .toList(),
      deliveryTime: 30,
      deliveryFee: 20.0,
      distance: 1.5,
    ),
    Restraurant(
      priceCatagory: '\$\$',
      menuItems: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 4)
          .toList(),
      id: 4,
      imageUrl:
          'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmVzdGF1cmFudHN8ZW58MHx8MHx8&w=1000&q=80',
      name: 'Royal Hotel',
      tags: MenuItem.menuItems
          .where((menuItem) => menuItem.restraurantId == 4)
          .map((MenuItem) => MenuItem.catagory)
          .toSet()
          .toList(),
      deliveryTime: 20,
      deliveryFee: 10.0,
      distance: 1.0,
    ),
  ];
}
