import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_init.dart';

class BaseBloc<T extends StateStreamableSource<Object?>>
    extends StatefulWidget {
  final Function(T)? onStateReady;
  final Widget? child;
  final T? model;
  const BaseBloc({Key? key, this.onStateReady, this.child, this.model})
      : super(key: key);
  @override
  _BaseBlocState<T> createState() => _BaseBlocState<T>();
}

class _BaseBlocState<T extends StateStreamableSource<Object?>>
    extends State<BaseBloc<T>> {
  T state = AppInit.getIt<T>();
  @override
  void initState() {
    if (widget.model != null) {
      state = widget.model!;
    }

    if (widget.onStateReady != null) {
      widget.onStateReady!(state);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<T>.value(
      value: state,
      child: widget.child,
    );
  }
}
