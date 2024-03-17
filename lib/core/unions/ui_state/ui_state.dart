import 'package:flutter_tutorial/core/unions/exception/exception.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part "ui_state.freezed.dart";

@Freezed(map: FreezedMapOptions(map: false, mapOrNull: false, maybeMap: false))
abstract class UiState<T> with _$UiState {
  factory UiState.initial() = UiStateInitial;
  factory UiState.laoding() = UiStateLoading;
  factory UiState.failure(CallException callException) = UiStateFailure;
  factory UiState.success(T v) = UiStateSuccess;
}
