// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PropertyModel _$PropertyModelFromJson(Map<String, dynamic> json) =>
    PropertyModel(
      id: json['id'] as String,
      title: json['title'] as String,
      address: json['address'] as String,
      price: (json['price'] as num).toDouble(),
      bedrooms: (json['bedrooms'] as num).toInt(),
      bathrooms: (json['bathrooms'] as num).toInt(),
      squareFootage: (json['squareFootage'] as num).toInt(),
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      agent: AgentModel.fromJson(json['agent'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropertyModelToJson(PropertyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'address': instance.address,
      'price': instance.price,
      'bedrooms': instance.bedrooms,
      'bathrooms': instance.bathrooms,
      'squareFootage': instance.squareFootage,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'agent': instance.agent.toJson(),
    };
