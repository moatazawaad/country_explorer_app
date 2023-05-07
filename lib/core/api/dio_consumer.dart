import 'dart:convert';
import 'dart:io';
import 'package:country_explorer/core/api/status_code.dart';
import 'package:country_explorer/features/all_countries/data/models/countries_model.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import '../error/full_exception.dart';
import '../network/remote/end_points.dart';
import 'api_consumer.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };

    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        return status! < StatusCode.internalServerError;
      };
    // client.interceptors.add(sl<AppIntercepters>());
    // if (kDebugMode) {
    //   client.interceptors.add(sl<LogInterceptor>());
    // }
  }

  // @override
  // Future<List<CountriesModel>> get(String path, {Map<String, dynamic>? queryParameters}) async {
  //   try {
  //     final response = await client.get(path, queryParameters: queryParameters);
  //     // if (response.data == null) {
  //     //   return [];
  //     // }
  //     return _handleResponseAsJson(response);
  //   } on DioError catch (error) {
  //     _handleDioError(error);
  //   }
  //   return [];
  // }

  @override
  Future<List<CountriesModel>> get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(path, queryParameters: queryParameters);
      return _handleResponseAsJson(response);
    } on DioError catch (error) {
      return _handleDioError(error);
    }
  }


  List<CountriesModel> _handleResponseAsJson(Response<dynamic> response) {
    final responseJson = jsonDecode(response.data.toString());
    if(responseJson is List<dynamic>) {
      return List<CountriesModel>.from(responseJson.map((e) => CountriesModel.fromJson(e)));
    } else {
      throw ResultNotFoundException();
    }
  }


  dynamic _handleDioError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();
      case DioErrorType.badResponse:
        switch (error.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unauthorized:
          case StatusCode.forbidden:
            throw const UnauthorizedException();
          case StatusCode.notFound:
            if (error.response?.data is String || error.response!.data is dynamic) {
              throw const ResultNotFoundException(); // throw a new exception for string/dynamic response
            } else {
              throw const NotFoundException();
            }          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internalServerError:
            throw const InternalServerErrorException();
        }
        break;
      case DioErrorType.cancel:
        throw const NoInternetConnectionException();
        case DioErrorType.unknown:
        throw const NoInternetConnectionException();
      case DioErrorType.badCertificate:
        throw const UnauthorizedException();
        case DioErrorType.connectionError:
          throw const FetchDataException();
    }
  }


}
