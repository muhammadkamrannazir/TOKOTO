import 'package:equatable/equatable.dart';

class Voucher extends Equatable {
  final int id;
  final String code;
  final double value;

  const Voucher({required this.id, required this.code, required this.value});

  @override
  List<Object?> get props => [id, code, value];

  static List<Voucher> vouchers = [
    const Voucher(id: 1, code: 'save5', value: 5.0,),
    const Voucher(id: 2, code: 'save10', value: 10.0,),
    const Voucher(id: 3, code: 'save15', value: 15.0,),
  ];
}
