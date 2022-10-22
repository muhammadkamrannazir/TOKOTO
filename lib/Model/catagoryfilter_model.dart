import 'package:equatable/equatable.dart';
import 'package:tokoto/Model/catagory_model.dart';

class Catagoryfilter extends Equatable {
  final int id;
  final Catagory catagory;
  final bool value;

  const Catagoryfilter(
      {required this.id, required this.catagory, required this.value});

  Catagoryfilter copyWith({int? id, Catagory? catagory, bool? value}) {
    return Catagoryfilter(
        id: id ?? this.id,
        catagory: catagory ?? this.catagory,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props => [id, catagory, value];

  static List<Catagoryfilter> filters = Catagory.catagories
      .map((catagory) =>
          Catagoryfilter(id: catagory.id, catagory: catagory, value: false))
      .toList();
}
