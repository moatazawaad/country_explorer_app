List<DummyModel> dummyCountries = [
  DummyModel(
    common: "Egypt",
    official: "Arab Republic of Egypt",
    currencyName: "Egyptian Pound",
    symbol: "£",
    capital: ["Cairo"],
    altSpelling: ['Egy', "EG"],
    region: "Africa",
    subRegion: "Northern Africa",
    language: "Arabic",
    latLang: [27, 30],
    border: ['ISR', 'LBY', 'PSY', 'SDN'],
    area: 1002450.0,
    googleMaps: "https://goo.gl/maps/uoDRhXbsqjG6L7VG7",
    openStreetMaps: "https://www.openstreetmap.org/relation/1473947",
    population: 102334403,
    timezone: ["UTC+02:00"],
    continent: ["Africa"],
    flagPNG: "https://flagcdn.com/w320/eg.png",
    flagSVG: "https://flagcdn.com/eg.svg",
    flagALT:
        "The flag of Egypt is composed of three equal horizontal bands of red, white and black, with Egypt's national emblem — a hoist-side facing gold eagle of Saladin — centered in the white band.",
    coatsPNG: "https://mainfacts.com/media/images/coats_of_arms/eg.png",
    coatsSVG: "https://mainfacts.com/media/images/coats_of_arms/eg.svg",
    coatsALT: "N/A",
    startOfWeek: "Sunday",
    capitalInfo: [30.05, 31.25],
  ),
];

// List<NameCommonOfficial> dummyNameCommon = [
//   const NameCommonOfficial(
//       common: "Egypt", official: "Arab Republic of Egypt "),
// ];
//
// List<Flags> dummyFlags = [
//   const Flags(
//       png: "https://flagcdn.com/w320/eg.png",
//       svg: "https://flagcdn.com/eg.svg",
//       alt:
//           "The flag of Egypt is composed of three equal horizontal bands of red, white and black, with Egypt's national emblem — a hoist-side facing gold eagle of Saladin — centered in the white band."),
// ];
//
// List<Currencies> dummyCurrencies = [
//   const Currencies(
//     name: "Egyptian Pound",
//     symbol: "£",
//   ),
// ];
//
// List<Maps> dummyMaps = [
//   const Maps(
//     googleMaps: "https://goo.gl/maps/uoDRhXbsqjG6L7VG7",
//     openStreetMaps: "https://www.openstreetmap.org/relation/1473947",
//   ),
// ];
//
// List<LanguagesModel> dummyLanguages = [
//   const LanguagesModel(name: "Arabic"),
// ];
//
// List<CoatsOfArmsModel> dummyCoatsOfArms = [
//   CoatsOfArmsModel(
//     png: "https://mainfacts.com/media/images/coats_of_arms/eg.png",
//     svg: "https://mainfacts.com/media/images/coats_of_arms/eg.svg",
//     alt: "N/A",
//   ),
// ];
//
// List<dynamic> dummyCapitalInfo = ['30.05', '31.25'];

class DummyModel {
  final String common;
  final String official;
  final String currencyName;
  final String symbol;
  final List<String> capital;
  final List<String> altSpelling;
  final String region;
  final String subRegion;
  final String language;
  final List<dynamic> latLang;
  final List<dynamic> border;
  final double area;
  final String googleMaps;
  final String openStreetMaps;
  final int population;
  final List<dynamic> timezone;
  final List<dynamic> continent;
  final String flagPNG;
  final String flagSVG;
  final String flagALT;
  final String coatsPNG;
  final String coatsSVG;
  final String coatsALT;
  final String startOfWeek;
  final List<dynamic> capitalInfo;

  DummyModel({
    required this.common,
    required this.official,
    required this.currencyName,
    required this.symbol,
    required this.capital,
    required this.altSpelling,
    required this.region,
    required this.subRegion,
    required this.language,
    required this.latLang,
    required this.border,
    required this.area,
    required this.googleMaps,
    required this.openStreetMaps,
    required this.population,
    required this.timezone,
    required this.continent,
    required this.flagPNG,
    required this.flagSVG,
    required this.flagALT,
    required this.coatsPNG,
    required this.coatsSVG,
    required this.coatsALT,
    required this.startOfWeek,
    required this.capitalInfo,
  });
}
