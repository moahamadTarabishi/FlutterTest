// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edition_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EditionsResultDto _$EditionsResultDtoFromJson(Map<String, dynamic> json) =>
    _EditionsResultDto(
      editionsWithFeatures:
          (json['editionsWithFeatures'] as List<dynamic>?)
              ?.map(
                (e) =>
                    EditionWithFeaturesDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const [],
    );

Map<String, dynamic> _$EditionsResultDtoToJson(_EditionsResultDto instance) =>
    <String, dynamic>{'editionsWithFeatures': instance.editionsWithFeatures};

_EditionWithFeaturesDto _$EditionWithFeaturesDtoFromJson(
  Map<String, dynamic> json,
) => _EditionWithFeaturesDto(
  edition: EditionDto.fromJson(json['edition'] as Map<String, dynamic>),
  featureValues: json['featureValues'] as List<dynamic>? ?? const [],
);

Map<String, dynamic> _$EditionWithFeaturesDtoToJson(
  _EditionWithFeaturesDto instance,
) => <String, dynamic>{
  'edition': instance.edition,
  'featureValues': instance.featureValues,
};

_EditionDto _$EditionDtoFromJson(Map<String, dynamic> json) => _EditionDto(
  id: (json['id'] as num).toInt(),
  displayName: json['displayName'] as String,
  isRegistrable: json['isRegistrable'] as bool? ?? true,
  monthlyPrice: (json['monthlyPrice'] as num?)?.toDouble(),
  annualPrice: (json['annualPrice'] as num?)?.toDouble(),
  hasTrial: json['hasTrial'] as bool? ?? false,
  isMostPopular: json['isMostPopular'] as bool? ?? false,
);

Map<String, dynamic> _$EditionDtoToJson(_EditionDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'isRegistrable': instance.isRegistrable,
      'monthlyPrice': instance.monthlyPrice,
      'annualPrice': instance.annualPrice,
      'hasTrial': instance.hasTrial,
      'isMostPopular': instance.isMostPopular,
    };
