import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:trivia_game/services/api_client.dart';

import 'api_client_test.mocks.dart';

@GenerateMocks([ApiClient])
void main() {
  late MockApiClient apiClient;

  group('getAll', () {
    setUp(() {
      apiClient = MockApiClient();

      final mockResponse = Response(
        statusCode: 200,
        data: jsonEncode({
          'response_code': 0,
          'results': [{}]
        }),
        requestOptions: RequestOptions(
          path: 'localhost:4000',
        ),
      );

      when(
        apiClient.getAll(
          any,
          any,
        ),
      ).thenAnswer((_) async => mockResponse);
    });

    test('has to returns status code 200', () async {
      final response = await apiClient.getAll('/path', {'amout': 10});

      expect(response?.statusCode, 200);
    });

    test('has to returns a reponse with json data', () async {
      final response = await apiClient.getAll('/api.php', {'amout': 10});

      expect(jsonDecode(response?.data), {
        'response_code': 0,
        'results': [{}]
      });
    });
  });
}
