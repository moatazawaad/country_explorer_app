import 'package:equatable/equatable.dart';

class Currencies extends  Equatable {
  final String name;
  final String symbol;

  const Currencies({required this.name, required this.symbol});

  @override
  // TODO: implement props
  List<Object?> get props => [name, symbol];
}