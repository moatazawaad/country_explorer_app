import 'package:equatable/equatable.dart';

class Maps extends Equatable {
  final String googleMaps;
  final String openStreetMaps;

  const Maps({required this.googleMaps, required this.openStreetMaps});

  @override
  // TODO: implement props
  List<Object?> get props => [googleMaps, openStreetMaps];

}