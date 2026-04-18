import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failures.freezed.dart';

@freezed
sealed class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.empty() = ValueFailureEmpty<T>;
  const factory ValueFailure.invalidEmail({required T failedValue}) =
      ValueFailureInvalidEmail<T>;
  const factory ValueFailure.invalidTenantName({required T failedValue}) =
      ValueFailureInvalidTenantName<T>;
  const factory ValueFailure.invalidLength({required T failedValue}) =
      ValueFailureInvalidLength<T>;
  const factory ValueFailure.lettersOnly({required T failedValue}) =
      ValueFailureLettersOnly<T>;
  const factory ValueFailure.weakPassword() = ValueFailureWeakPassword<T>;
}

class UnexpectedValueError extends Error {
  UnexpectedValueError(this.valueFailure);
  final ValueFailure<dynamic> valueFailure;

  @override
  String toString() => 'Unexpected value error: $valueFailure';
}
