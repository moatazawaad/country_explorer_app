class EndPoints {
  static const String baseUrl = 'https://restcountries.com/v3.1/';
  static const String egypt = '${baseUrl}name/egypt';
  static const String allCountries = '${baseUrl}all';
  static const String united = '${baseUrl}name/united';
  static const String europe = '${baseUrl}region/europe';
  static const String oceania = '${baseUrl}region/oceania';
  static const String northAmerica = '${baseUrl}region/north america';
  static const String southAmerica = '${baseUrl}region/south america';
  static const String africa = '${baseUrl}region/africa';
  static String searchByName(String name) => '${baseUrl}name/$name';
}