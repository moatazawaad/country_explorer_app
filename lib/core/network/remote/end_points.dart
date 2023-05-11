class EndPoints {
  static const String baseUrl = 'https://restcountries.com/v3.1/';
  static const String allCountries = '${baseUrl}all';
  static String searchByName(String name) => '${baseUrl}name/$name';
}