import 'package:dio/dio.dart';

class BooksWebservices {
  final Dio _dio;
  final String baseUrl = "https://www.googleapis.com/books/v1/";
  BooksWebservices(this._dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    final response = await _dio.get('$baseUrl$endPoint');
    return response.data;
  }
}
