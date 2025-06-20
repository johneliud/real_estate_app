part of 'property_detail_cubit.dart';

abstract class PropertyDetailState extends Equatable {
  const PropertyDetailState();

  @override
  List<Object> get props => [];
}

class PropertyDetailInitial extends PropertyDetailState {}

class PropertyDetailLoading extends PropertyDetailState {}

class PropertyDetailLoaded extends PropertyDetailState {
  final PropertyModel property;

  const PropertyDetailLoaded(this.property);

  @override
  List<Object> get props => [property];
}

class PropertyDetailError extends PropertyDetailState {
  final String message;

  const PropertyDetailError(this.message);

  @override
  List<Object> get props => [message];
}