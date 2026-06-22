import 'dart:async';

import 'package:bloc/bloc.dart';

abstract class BaseCubit<STATE, EFFECT> extends Cubit<STATE> {
  BaseCubit(super.initialState);

  final StreamController<EFFECT> _effectController = StreamController<EFFECT>.broadcast();
  Stream<EFFECT> get sideEffect => _effectController.stream;

  void emitEffect(EFFECT effect) {
    if (!_effectController.isClosed) {
      _effectController.add(effect);
    }
  }

  @override
  Future<void> close() {
    _effectController.close();
    return super.close();
  }
}
