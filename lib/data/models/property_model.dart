import 'package:json_annotation/json_annotation.dart';
import 'agent_model.dart';

part 'property_model.g.dart';

@JsonSerializable(explicitToJson: true) // explicitToJson for nested AgentModel
class PropertyModel {
  final String id;
  final String title;
  final String address;
  final double price;
  final int bedrooms;
  final int bathrooms;
  final int squareFootage;
  final String description;
  final String imageUrl;
  final AgentModel agent;

  PropertyModel({
    required this.id,
    required this.title,
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.squareFootage,
    required this.description,
    required this.imageUrl,
    required this.agent,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) =>
      _$PropertyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyModelToJson(this);
}