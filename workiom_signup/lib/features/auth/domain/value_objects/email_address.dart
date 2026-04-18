import 'package:dartz/dartz.dart';
import 'package:workiom_signup/core/domain/value_object.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';

class EmailAddress extends ValueObject<String> {
  factory EmailAddress(String input) => EmailAddress._(_validate(input));

  const EmailAddress._(this.value);

  const EmailAddress.pure()
      : value = const Left(ValueFailure<String>.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static final _regex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.-]+$');

  static Either<ValueFailure<String>, String> _validate(String input) {
    if (input.isEmpty) return const Left(ValueFailure.empty());
    return _regex.hasMatch(input)
        ? Right(input)
        : Left(ValueFailure.invalidEmail(failedValue: input));
  }
}
