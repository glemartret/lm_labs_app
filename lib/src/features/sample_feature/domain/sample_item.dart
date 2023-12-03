import 'package:freezed_annotation/freezed_annotation.dart';

part 'sample_item.freezed.dart';
part 'sample_item.g.dart';

@freezed

/// A placeholder class that represents an entity or model.
class SampleItem with _$SampleItem {
  const factory SampleItem({
    required int id,
  }) = _SampleItem;

  factory SampleItem.fromJson(Map<String, dynamic> json) =>
      _$SampleItemFromJson(json);
}
