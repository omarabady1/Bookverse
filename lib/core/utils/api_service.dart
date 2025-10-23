import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://www.googleapis.com/books/v1/';
  final _apiKey = 'AIzaSyA89hBcOejrJY1hcTSPgUdy3qnQoloplgE';
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await dio.get('$_baseUrl$endPoint&key=$_apiKey');
    return response.data;
  }
}
