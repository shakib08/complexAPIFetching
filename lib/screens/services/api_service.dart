import 'dart:convert';
import 'package:complex/screens/Model/model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<complex>> fetchComplexData() async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => complex.fromJson(data)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
