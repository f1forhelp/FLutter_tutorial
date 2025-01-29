import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName}}_state.dart';
part '{{featureName}}_cubit.freezed.dart';

class {{featureName}}Cubit extends Cubit<{{featureName}}State> {
  {{featureName}}Cubit(super.initialState);
}
