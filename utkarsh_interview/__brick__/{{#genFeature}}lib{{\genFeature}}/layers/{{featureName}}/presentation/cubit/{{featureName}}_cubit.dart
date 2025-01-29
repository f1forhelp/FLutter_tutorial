import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName}}_state.dart';
part '{{featureName}}_cubit.freezed.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(super.initialState);
}
