import 'package:valorant_app/domain/value_objects/ability_value_object.dart';
import 'package:valorant_app/shared/enums/role_enum.dart';

class AgentModel {
  final String name;
  final String description;
  final String portraitImage;
  final String fullBodyImage;
  final RoleEnum role;
  final List<AbilityValueObject> abilities;

  AgentModel({
    required this.name,
    required this.description,
    required this.portraitImage,
    required this.fullBodyImage,
    required this.role,
    required this.abilities,
  });

  AgentModel copyWith({
    String? name,
    String? description,
    String? portraitImage,
    String? fullBodyImage,
    RoleEnum? role,
    List<AbilityValueObject>? abilities,
  }) {
    return AgentModel(
      name: name ?? this.name,
      description: description ?? this.description,
      portraitImage: portraitImage ?? this.portraitImage,
      fullBodyImage: fullBodyImage ?? this.fullBodyImage,
      role: role ?? this.role,
      abilities: abilities ?? this.abilities,
    );
  }

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      name: json['displayName'],
      description: json['description'],
      portraitImage: json['displayIcon'],
      fullBodyImage: json['fullPortrait'],
      role: _fromStringToRoleEnum(json['role']['displayName']),
      abilities: _fromJsonToAbilitiesList(json['abilities']),
    );
  }

  static List<AbilityValueObject> _fromJsonToAbilitiesList(
    List<dynamic> listJson,
  ) {
    final abilities =
        listJson.map((agent) {
          return AbilityValueObject(
            name: agent['displayName'],
            descripton: agent['description'],
            image: agent['displayIcon'],
          );
        }).toList();
    return abilities;
  }

  static RoleEnum _fromStringToRoleEnum(String name) {
    return switch (name) {
      'Initiator' => RoleEnum.initiator,
      'Sentinel' => RoleEnum.sentinel,
      'Controller' => RoleEnum.controller,
      'Duelist' => RoleEnum.duelist,
      _ => RoleEnum.unknown,
    };
  }
}
