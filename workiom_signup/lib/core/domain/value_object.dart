import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:workiom_signup/core/utils/value_failures.dart';

@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  T getOrCrash() => value.fold((f) => throw UnexpectedValueError(f), id);

  bool get isValid => value.isRight();

  @override
  bool operator ==(Object other) =>
      other is ValueObject<T> && other.value == value;

  @override
  int get hashCode => value.hashCode;
}
