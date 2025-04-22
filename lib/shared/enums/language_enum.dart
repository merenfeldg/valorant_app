enum LanguageEnum {
  portuguese(
    name: 'Portuguese',
    acronym: 'pt',
    country: 'br',
    image: 'assets/images/flags/brazil_flag.png',
  ),
  english(
    name: 'English',
    acronym: 'en',
    country: 'us',
    image: 'assets/images/flags/eua_flag.png',
  ),
  spanish(
    name: 'Spanish',
    acronym: 'es',
    country: 'es',
    image: 'assets/images/flags/spain_flag.png',
  ),
  chinese(
    name: 'Chinese',
    acronym: 'zh-cn',
    country: 'cn',
    image: 'assets/images/flags/china_flag.png',
  ),
  france(
    name: 'France',
    acronym: 'fr',
    country: 'fr',
    image: 'assets/images/flags/france_flag.png',
  ),
  german(
    name: 'German',
    acronym: 'de',
    country: 'de',
    image: 'assets/images/flags/germany_flag.png',
  );

  final String name;
  final String acronym;
  final String country;
  final String image;

  const LanguageEnum({
    required this.name,
    required this.acronym,
    required this.country,
    required this.image, //
  });
}
