// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'joke.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$JokeImpl _$$JokeImplFromJson(Map<String, dynamic> json) => _$JokeImpl(
      joke: json['joke'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$JokeImplToJson(_$JokeImpl instance) =>
    <String, dynamic>{
      'joke': instance.joke,
      'id': instance.id,
    };
