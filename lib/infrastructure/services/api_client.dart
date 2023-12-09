import 'package:dio/dio.dart';
import 'package:multi_package_clean_architecture/infrastructure/services/dio_client.dart';

class ApiClient {
  Future<Response<dynamic>> fetchData({
    required String baseUrl,
    required Map<String, dynamic>? headers,
  }) async {
    DioClient dioClient = DioClient();
    Dio dio = dioClient.dio;
    final response = await dio.get(
      baseUrl,
      options: Options(
        headers: headers,
      ),
    );
    return response;
  }
}
