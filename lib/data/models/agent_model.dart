import 'package:json_annotation/json_annotation.dart';

part 'agent_model.g.dart';

@JsonSerializable()
class AgentModel {
  final String name;
  final String phone;

  AgentModel({required this.name, required this.phone});

  factory AgentModel.fromJson(Map<String, dynamic> json) =>
      _$AgentModelFromJson(json);

  Map<String, dynamic> toJson() => _$AgentModelToJson(this);
}