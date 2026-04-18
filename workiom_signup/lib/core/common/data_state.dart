import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:workiom_signup/core/error/failures.dart';

part 'data_state.freezed.dart';

@freezed
sealed class DataState<T> with _$DataState<T> {
  const factory DataState.idle() = DataIdle<T>;
  const factory DataState.loading() = DataLoading<T>;
  const factory DataState.success(T data) = DataSuccess<T>;
  const factory DataState.failure(Failure failure) = DataFailure<T>;
}
