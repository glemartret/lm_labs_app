import 'package:i18n_extension/i18n_extension.dart';
import 'package:lm_labs_app/src/localization/i18n.dart';
// ignore_for_file: lines_longer_than_80_chars

// Search Strings without .i18n '(?!\.i18n)[\n\w\d\s.]*?'(?!\.i18n)(?!\n\.i18n)
extension SampleFeatureLocalization on String {
  static final _t = Translations.byText('en') +
      {
        'en': 'Item Details %d',
        'fr': "Détails de l'article %d",
      } +
      {
        'en': 'More Information Here',
        'fr': "Plus d'informations ici",
      } +
      {
        'en': 'Sample Items',
        'fr': "Articles d'échantillon",
      } +
      {
        'en': 'Sample Item %d',
        'fr': "Article d'échantillon %d",
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      } +
      {
        'en': '',
        'fr': '',
      };

  static Translations get translations => RunnerLocalization.translations * _t;

  String get i18n => localize(this, translations);
  String fill(List<Object> params) => localizeFill(i18n, params);
  String plural(int value) => localizePlural(value, this, translations);
}
