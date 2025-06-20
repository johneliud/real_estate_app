import '../models/property_model.dart';
import '../../simple_api_service.dart';

class PropertyRepository {
  final SimpleApiService _apiService;

  PropertyRepository({SimpleApiService? apiService})
      : _apiService = apiService ?? SimpleApiService();

  Future<List<PropertyModel>> fetchProperties() async {
    return _apiService.getProperties();
  }

  Future<PropertyModel> fetchPropertyDetails(String id) async {
    return _apiService.getPropertyDetails(id);
  }
}