import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../data/models/property_model.dart';
import '../../../data/repositories/property_repository.dart';

part 'property_list_state.dart';

class PropertyListCubit extends Cubit<PropertyListState> {
  final PropertyRepository _propertyRepository;

  PropertyListCubit(this._propertyRepository) : super(PropertyListInitial());

  Future<void> loadProperties() async {
    try {
      emit(PropertyListLoading());
      final properties = await _propertyRepository.fetchProperties();
      emit(PropertyListLoaded(properties));
    } catch (e) {
      emit(PropertyListError("Failed to fetch properties: ${e.toString()}"));
    }
  }
}