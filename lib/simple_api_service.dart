import 'dart:convert';
import 'package:http/http.dart' as http;
import 'data/models/property_model.dart';

class SimpleApiService {
  static const String _baseUrl = "http://localhost:8080/api";

  Future<List<PropertyModel>> getProperties() async {
    final response = await http.get(Uri.parse('$_baseUrl/properties'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<PropertyModel> properties = body
          .map((dynamic item) => PropertyModel.fromJson(item))
          .toList();
      return properties;
    } else {
      throw Exception('Failed to load properties: ${response.statusCode}');
    }
  }

  Future<PropertyModel> getPropertyDetails(String id) async {
    final response = await http.get(Uri.parse('$_baseUrl/properties/$id'));

    if (response.statusCode == 200) {
      return PropertyModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load property details: ${response.statusCode}');
    }
  }
}