import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final _apiKey = dotenv.env['API_KEY'];
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dio.get('$_baseUrl$endPoint&key=$_apiKey');
    return response.data;
  }
}
