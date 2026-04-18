import 'package:dartz/dartz.dart';
import 'package:workiom_signup/core/domain/value_object.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';

class TenantName extends ValueObject<String> {
  factory TenantName(String input) {
    final normalized = input.toLowerCase().trim();
    return TenantName._(_validate(normalized));
  }

  const TenantName._(this.value);

  const TenantName.pure()
      : value = const Left(ValueFailure<String>.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static final _regex = RegExp(r'^[a-z][a-z0-9-]*$');

  static Either<ValueFailure<String>, String> _validate(String input) {
    if (input.isEmpty) return const Left(ValueFailure.empty());
    if (input.length < 2 || input.length > 63) {
      return Left(ValueFailure.invalidLength(failedValue: input));
    }
    return _regex.hasMatch(input)
        ? Right(input)
        : Left(ValueFailure.invalidTenantName(failedValue: input));
  }
}
