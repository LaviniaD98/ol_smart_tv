// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ColorResponse _$ColorResponseFromJson(Map<String, dynamic> json) =>
    ColorResponse(
      idColor: json['idColor'] as int?,
      idConfColour: json['idConfColour'] as int?,
      name: json['name'] as String,
      rgb: json['rgb'] as String,
    );

Map<String, dynamic> _$ColorResponseToJson(ColorResponse instance) =>
    <String, dynamic>{
      'idColor': instance.idColor,
      'idConfColour': instance.idConfColour,
      'name': instance.name,
      'rgb': instance.rgb,
    };
