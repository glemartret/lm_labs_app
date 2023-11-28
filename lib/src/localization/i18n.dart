import 'package:i18n_extension/i18n_extension.dart';
// ignore_for_file: lines_longer_than_80_chars

// Search Strings without .i18n '(?!\.i18n)[\n\w\d\s.]*?'(?!\.i18n)(?!\n\.i18n)
extension LmLabsLocalization on String {
  static final _t = Translations('en') +
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
  static Translations get translations => _t;

  String get i18n => localize(this, translations);
  String fill(List<Object> params) => localizeFill(i18n, params);
  String plural(int value) => localizePlural(value, this, translations);
}
