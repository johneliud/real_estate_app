part of 'property_list_cubit.dart';

abstract class PropertyListState extends Equatable {
  const PropertyListState();

  @override
  List<Object> get props => [];
}

class PropertyListInitial extends PropertyListState {}

class PropertyListLoading extends PropertyListState {}

class PropertyListLoaded extends PropertyListState {
  final List<PropertyModel> properties;

  const PropertyListLoaded(this.properties);

  @override
  List<Object> get props => [properties];
}

class PropertyListError extends PropertyListState {
  final String message;

  const PropertyListError(this.message);

  @override
  List<Object> get props => [message];
}