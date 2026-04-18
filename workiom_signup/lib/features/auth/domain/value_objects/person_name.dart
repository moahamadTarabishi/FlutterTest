import 'package:dartz/dartz.dart';
import 'package:workiom_signup/core/domain/value_object.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';

class PersonName extends ValueObject<String> {
  factory PersonName(String input) {
    final trimmed = input.trim();
    return PersonName._(_validate(trimmed));
  }

  const PersonName._(this.value);

  const PersonName.pure()
      : value = const Left(ValueFailure<String>.empty());

  @override
  final Either<ValueFailure<String>, String> value;

  static final _regex = RegExp(r'^\p{L}+$', unicode: true);

  static Either<ValueFailure<String>, String> _validate(String input) {
    if (input.isEmpty) return const Left(ValueFailure.empty());
    return _regex.hasMatch(input)
        ? Right(input)
        : Left(ValueFailure.lettersOnly(failedValue: input));
  }
}
