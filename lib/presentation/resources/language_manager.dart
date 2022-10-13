enum LanguageType {
  english,
  afrikaans
}

const String afrikaans = "af";
const String english = "en";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.afrikaans:
        return afrikaans;
    }
  }
}