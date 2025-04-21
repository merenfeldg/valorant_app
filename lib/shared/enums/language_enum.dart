enum LanguageEnum {
  portuguese(
    name: 'Portuguese',
    acronym: 'br',
    image: 'assets/images/flags/brazil_flag.png',
  ),
  english(
    name: 'English',
    acronym: 'en',
    image: 'assets/images/flags/eua_flag.png',
  ),
  spanish(
    name: 'Spanish',
    acronym: 'es',
    image: 'assets/images/flags/spain_flag.png',
  ),
  chinese(
    name: 'Chinese',
    acronym: 'zh-cn',
    image: 'assets/images/flags/china_flag.png',
  ),
  france(
    name: 'France',
    acronym: 'fr',
    image: 'assets/images/flags/france_flag.png',
  ),
  german(
    name: 'German',
    acronym: 'de',
    image: 'assets/images/flags/germany_flag.png',
  );

  final String name;
  final String acronym;
  final String image;

  const LanguageEnum({
    required this.name,
    required this.acronym,
    required this.image, //
  });
}
