import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/property_model.dart';
import '../../../data/repositories/property_repository.dart';

part 'property_detail_state.dart';

class PropertyDetailCubit extends Cubit<PropertyDetailState> {
  final PropertyRepository _propertyRepository;

  PropertyDetailCubit(this._propertyRepository) : super(PropertyDetailInitial());

  Future<void> loadPropertyDetails(String id) async {
    try {
      emit(PropertyDetailLoading());
      final property = await _propertyRepository.fetchPropertyDetails(id);
      emit(PropertyDetailLoaded(property));
    } catch (e) {
      emit(PropertyDetailError("Failed to fetch property details: ${e.toString()}"));
    }
  }
}