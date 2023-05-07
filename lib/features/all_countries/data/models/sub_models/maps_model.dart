import 'package:country_explorer/core/utils/app_strings.dart';

import '../../../domain/entities/maps.dart';

class MapsModel extends Maps {
  MapsModel({required super.googleMaps, required super.openStreetMaps});

  factory MapsModel.fromJson(Map<String, dynamic> json) => MapsModel(
        googleMaps: json['googleMaps'] ?? AppStrings.notAvailable,
        openStreetMaps: json['openStreetMaps'] ?? AppStrings.notAvailable,
      );
}
