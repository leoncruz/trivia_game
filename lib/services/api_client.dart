import 'package:dio/dio.dart';

class ApiClient {
  final BaseOptions _options = BaseOptions(
    baseUrl: 'https://opentdb.com',
  );

  late Dio? _dio;

  ApiClient() {
    _dio = Dio(_options);
  }

  Future<Response?> getAll(
      String path, Map<String, dynamic> queryParameters) async {
    try {
      final Response? response =
          await _dio?.get(path, queryParameters: queryParameters);

      return response;
    } on DioError catch (e) {
      print('ApiClient - GET => ' + e.message);
    }
  }
}
