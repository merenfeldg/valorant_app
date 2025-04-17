import 'package:valorant_app/shared/enums/role_enum.dart';

class AgentModel {
  final String name;
  final String description;
  final String image;
  final RoleEnum role;

  AgentModel({
    required this.name,
    required this.description,
    required this.image,
    required this.role,
  });

  AgentModel copyWith({
    String? name,
    String? description,
    String? image,
    RoleEnum? role,
  }) {
    return AgentModel(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      role: role ?? this.role,
    );
  }

  factory AgentModel.fromJson(Map<String, dynamic> json) {
    return AgentModel(
      name: json['displayName'],
      description: json['description'],
      image: json['bustPortrait'],
      role: _fromStringToRoleEnum(json['role']['displayName']),
    );
  }

  static RoleEnum _fromStringToRoleEnum(String name) {
    return switch (name) {
      'Initiator' => RoleEnum.initiator,
      'Sentinel' => RoleEnum.sentinel,
      'Initiador' => RoleEnum.initiator,
      'Duelist' => RoleEnum.duelist,
      _ => RoleEnum.unknown,
    };
  }
}
