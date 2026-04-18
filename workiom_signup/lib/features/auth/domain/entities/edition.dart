import 'package:freezed_annotation/freezed_annotation.dart';

part 'edition.freezed.dart';

@freezed
abstract class Edition with _$Edition {
  const factory Edition({
    required int id,
    required String displayName,
    @Default(true) bool isRegistrable,
    double? monthlyPrice,
    double? annualPrice,
    @Default(false) bool hasTrial,
    @Default(false) bool isMostPopular,
  }) = _Edition;
}
