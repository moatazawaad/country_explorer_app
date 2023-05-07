import 'package:country_explorer/core/utils/app_strings.dart';

class CapitalInfoModel {
  final List<dynamic>? latitudeLongitude;

  const CapitalInfoModel({required this.latitudeLongitude});

  factory CapitalInfoModel.fromJson(Map<String, dynamic> json) =>
      CapitalInfoModel(latitudeLongitude: json['latlng'] ?? []);
}