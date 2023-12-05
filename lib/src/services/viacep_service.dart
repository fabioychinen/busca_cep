import 'package:dio/dio.dart';

class ViaCEPService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://viacep.com.br/ws/01001000/json/';

  Future<Map<String, dynamic>> fetchCEP(String cep) async {
    try {
      final response = await _dio.get('$_baseUrl/$cep/json');
      return response.data;
    } catch (error) {
      rethrow;
    }
  }
}
