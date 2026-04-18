import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/features/auth/domain/entities/edition.dart';

part 'edition_dto.freezed.dart';
part 'edition_dto.g.dart';

@freezed
abstract class EditionsResultDto with _$EditionsResultDto {
  const factory EditionsResultDto({
    @Default([]) List<EditionWithFeaturesDto> editionsWithFeatures,
  }) = _EditionsResultDto;

  factory EditionsResultDto.fromJson(Map<String, dynamic> json) =>
      _$EditionsResultDtoFromJson(json);
}

@freezed
abstract class EditionWithFeaturesDto with _$EditionWithFeaturesDto {
  const factory EditionWithFeaturesDto({
    required EditionDto edition,
    @Default([]) List<dynamic> featureValues,
  }) = _EditionWithFeaturesDto;

  factory EditionWithFeaturesDto.fromJson(Map<String, dynamic> json) =>
      _$EditionWithFeaturesDtoFromJson(json);
}

@freezed
abstract class EditionDto with _$EditionDto {
  const factory EditionDto({
    required int id,
    required String displayName,
    @Default(true) bool isRegistrable,
    double? monthlyPrice,
    double? annualPrice,
    @Default(false) bool hasTrial,
    @Default(false) bool isMostPopular,
  }) = _EditionDto;

  factory EditionDto.fromJson(Map<String, dynamic> json) =>
      _$EditionDtoFromJson(json);
}

extension EditionDtoMapper on EditionDto {
  Edition toDomain() => Edition(
        id: id,
        displayName: displayName,
        isRegistrable: isRegistrable,
        monthlyPrice: monthlyPrice,
        annualPrice: annualPrice,
        hasTrial: hasTrial,
        isMostPopular: isMostPopular,
      );
}
