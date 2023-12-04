import 'package:dio/dio.dart';

class ApiClient {
  Future<Response<dynamic>> fetchData({
    required String baseUrl,
    required Map<String, dynamic>? headers,
  }) async {
    Dio dio = Dio();
    final response = await dio.get(
      baseUrl,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
// 'https://api.api-ninjas.com/v1/city?name=$cityName&limit=30',