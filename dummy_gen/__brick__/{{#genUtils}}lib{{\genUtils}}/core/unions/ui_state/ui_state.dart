import 'package:freezed_annotation/freezed_annotation.dart';

part 'ui_state.freezed.dart';

@freezed
sealed class UiState<T> with _$UiState {
  factory UiState.initial() = UiStateInitial;
  factory UiState.loading() = UiStateLoading;
  factory UiState.loaded(T data) = UiStateLoaded<T>;
  factory UiState.error(String message) = UiStateError;
}
