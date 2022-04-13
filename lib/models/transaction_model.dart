import 'package:airplane/models/destination_model.dart';
import 'package:airplane/models/user_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final UserModel user;

  final int amountOfTraveler;
  final String selectedSeates;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  TransactionModel({
    required this.destination,
    required this.user,
    this.id='',
    this.amountOfTraveler = 0,
    this.selectedSeates = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });
factory TransactionModel.fromJson(String id, Map<String, dynamic> json) =>
      TransactionModel(
        user: UserModel.fromJson(json['user']['id'], json['user']),
        destination: DestinationModel.fromJson(json['destination']['id'], json['destination']),
        id: id,
        amountOfTraveler: json['amountOfTraveler'],
        selectedSeates: json['selectedSeats'],
        insurance: json['insurance'],
        refundable: json['refundable'],
        vat: json['vat'],
        price: json['price'],
        grandTotal: json['grandTotal'],
        
      );
  @override
  List<Object?> get props => [
        user,
        destination,
        amountOfTraveler,
        selectedSeates,
        insurance,
        refundable,
        vat,
        price,
        grandTotal
      ];
}
