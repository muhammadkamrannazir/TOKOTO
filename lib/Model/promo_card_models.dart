// ignore_for_file: non_constant_identifier_names

import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final String title;
  final int id;
  final String description;
  final String imageurl;

  const Promo(
      {required this.title,
      required this.id,
      required this.description,
      required this.imageurl});

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageurl,
      ];

  static List<Promo> promo = [
    const Promo(
      title: 'Free Delivery on First 3 Orders',
      id: 1,
      description: 'Place an order up to \$10 and delivery fee is on us',
      imageurl:
          'https://images.pexels.com/photos/958545/pexels-photo-958545.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
    ),
    const Promo(
      title: '20% of on the selected Restaurants.',
      id: 1,
      description: 'Get Discount on 20+ Restaurants.',
      imageurl:
          'https://thumbs.dreamstime.com/b/fast-food-concept-greasy-fried-restaurant-take-out-as-onion-rings-burger-hot-dogs-fried-chicken-french-fries-31114163.jpg',
    ),
    const Promo(
      title: 'Get Free voucher on every delivery',
      id: 1,
      description: 'Place an order up to \$10 and get free voucher to get discounts',
      imageurl:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtPXqp1iLnoXB54PZv241UpGWUE5NPt3x1TrhHoxsxZcOGj6Vt_DYEfe3kztTC6wnIZso&usqp=CAU',
    ),
  ];
}
