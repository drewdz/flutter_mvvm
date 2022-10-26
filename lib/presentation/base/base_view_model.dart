
import 'dart:async';

import 'package:mvvm_course/presentation/common/state_renderer/state_renderer.dart';

abstract class BaseViewModel
    extends BaseViewModelInputs
    with BaseViewModelOutputs {

  final StreamController<FlowState> _inputStateStreamController = StreamController<FlowState>.broadcast();

  @override
  Sink get inputState => _inputStateStreamController.sink;

  @override
  Stream<FlowState> get outputState => _inputStateStreamController.stream.map((flowState) => flowState);

  @override
  void dispose() {
    _inputStateStreamController.close();
  }
}

abstract class BaseViewModelInputs{
  void start();
  void dispose();

  Sink get inputState;
}

abstract class BaseViewModelOutputs {
  Stream<FlowState> get outputState;
}