class AbilityValueObject {
  final String name;
  final String image;
  final String descripton;

  AbilityValueObject({
    required this.name,
    required this.image,
    required this.descripton, //
  });

  AbilityValueObject copyWith({
    String? name,
    String? image,
    String? descripton,
  }) {
    return AbilityValueObject(
      name: name ?? this.name,
      image: image ?? this.image,
      descripton: descripton ?? this.descripton,
    );
  }
}
