enum RoleEnum {
  duelist(
    name: 'Duelist',
    image: '', //
  ),
  initiator(
    name: 'Initiator',
    image: '', //
  ),
  controller(
    name: 'Controller',
    image: '', //
  ),
  sentinel(
    name: 'Sentinel',
    image: '', //
  ),
  unknown(
    name: 'Unkown',
    image: '', //
  );

  final String name;
  final String image;

  const RoleEnum({
    required this.name,
    required this.image, //
  });
}
