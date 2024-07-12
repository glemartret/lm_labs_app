import 'package:i18n_extension/i18n_extension.dart';
import 'package:lm_labs_app/src/localization/i18n.dart';
// ignore_for_file: lines_longer_than_80_chars

// Search Strings without .i18n '(?!\.i18n)[\n\w\d\s.]*?'(?!\.i18n)(?!\n\.i18n)
extension CounterLocalization on String {
  static final _t = Translations.byText('en') +
      {
        'en': 'Counter',
        'fr': 'Compteur',
      } +
      {
        'en': 'You have pushed the button this many times:',
        'fr': 'Vous avez appuyé sur le bouton autant de fois:',
      } +
      {
        'en': 'Increment',
        'fr': 'Augmenter',
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
