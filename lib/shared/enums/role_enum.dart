enum RoleEnum {
  duelist(
    name: 'Duelist',
    image: 'assets/images/role_icons/duelist_icon.png', //
  ),
  initiator(
    name: 'Initiator',
    image: 'assets/images/role_icons/initiator_icon.png', //
  ),
  controller(
    name: 'Controller',
    image: 'assets/images/role_icons/controller_icon.png', //
  ),
  sentinel(
    name: 'Sentinel',
    image: 'assets/images/role_icons/sentinel_icon.png', //
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
