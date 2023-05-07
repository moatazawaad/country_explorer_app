import 'package:country_explorer/core/utils/app_strings.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/capital_info_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/coats_of_arms_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/currencies_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/flags_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/languages_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/maps_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/name_model.dart';
import 'package:country_explorer/features/countries/data/models/sub_models/postal_code_model.dart';

class CountriesModel {
  final NameModel name;
  final CurrenciesModel currencies;
  final List<String>? capital;
  final List<String>? altSpellings;
  final String? region;
  final String? subRegion;
  final LanguagesModel languages;
  final List<dynamic>? latitudeLongitude;
  final List<dynamic>? borders;
  final double? area;
  final MapsModel maps;
  final int? population;
  final List<dynamic>? timezones;
  final List<dynamic>? continents;
  final FlagsModel flags;
  final CoatsOfArmsModel coatsOfArms;
  final String? startOfWeek;
  final CapitalInfoModel capitalInfo;
  final PostalCodeModel postalCode;

  const CountriesModel({
    required this.name,
    required this.currencies,
    required this.capital,
    required this.altSpellings,
    required this.region,
    required this.subRegion,
    required this.languages,
    required this.latitudeLongitude,
    required this.borders,
    required this.area,
    required this.maps,
    required this.population,
    required this.timezones,
    required this.continents,
    required this.flags,
    required this.coatsOfArms,
    required this.startOfWeek,
    required this.capitalInfo,
    required this.postalCode,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
        name: NameModel.fromJson(json['name'] ?? {}),
        currencies: CurrenciesModel.fromJson(json['currencies']),
        capital: List<String>.from(json['capital'] ?? []),
        altSpellings: List<String>.from(json['altSpellings'] ?? []),
        region: json['region'] ?? AppStrings.notAvailable,
        subRegion: json['subregion'] ?? AppStrings.notAvailable,
        languages: LanguagesModel.fromJson(json['languages']),
        latitudeLongitude: json['latlng'] ?? [],
        borders: json['borders'] ?? [],
        area: json['area'] ?? AppStrings.notAvailable,
        maps: MapsModel.fromJson(json['maps'] ?? {}),
        population: json['population'] ?? AppStrings.notAvailable,
        timezones: json['timezones'] ?? [],
        continents: json['continents'] ?? [],
        flags: FlagsModel.fromJson(json['flags'] ?? {}),
        coatsOfArms: CoatsOfArmsModel.fromJson(json['coatOfArms'] ?? {}),
        startOfWeek: json['startOfWeek'] ?? AppStrings.notAvailable,
        capitalInfo: CapitalInfoModel.fromJson(json['capitalInfo'] ?? []),
        postalCode: PostalCodeModel.fromJson(json['postalCode'] ?? {}),
      );
}
