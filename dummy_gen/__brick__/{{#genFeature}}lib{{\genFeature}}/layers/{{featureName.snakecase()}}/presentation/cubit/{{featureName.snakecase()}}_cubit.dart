import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part '{{featureName.snakeCase()}}_state.dart';
part '{{featureName.snakeCase()}}_cubit.freezed.dart';

class {{featureName.pascalCase()}}Cubit extends Cubit<{{featureName.pascalCase()}}State> {
  {{featureName.pascalCase()}}Cubit(super.initialState);
}
