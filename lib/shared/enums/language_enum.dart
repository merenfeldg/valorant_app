enum LanguageEnum {
  portuguese(
    name: 'Portuguese',
    image: 'assets/images/flags/brazil_flag.png', //
  ),
  english(
    name: 'English',
    image: 'assets/images/flags/eua_flag.png', //
  ),
  spanish(
    name: 'Spanish',
    image: 'assets/images/flags/spain_flag.png', //
  ),
  chinese(
    name: 'Chinese',
    image: 'assets/images/flags/china_flag.png', //
  ),
  france(
    name: 'France',
    image: 'assets/images/flags/france_flag.png', //
  ),
  german(
    name: 'German',
    image: 'assets/images/flags/germany_flag.png', //
  );

  final String name;
  final String image;

  const LanguageEnum({
    required this.name,
    required this.image, //
  });
}
