import 'package:dio/dio.dart';

class DioClient {
  static final Dio _dio = Dio()
    ..options = BaseOptions(baseUrl: 'https://api.api-ninjas.com');

  Dio get dio => _dio;

  DioClient._privateConstructor();

  static final DioClient _instance = DioClient._privateConstructor();

  factory DioClient() {
    return _instance;
  }

  //retry token
  //refresh token
}
