import 'dart:async';

import 'package:mvvm_course/presentation/base_view_model.dart';

import '../../domain/model/model.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingViewModel
    extends BaseViewModel
    with OnboardingViewModelInputs, OnboardingViewModelOutputs
{
  final StreamController<OnboardingState> _streamController = StreamController<OnboardingState>();
  late final List<SliderState> _list;
  int _currentIndex = 0;

  //  inputs
  @override
  void dispose() {
    _streamController.close();
  }

  @override
  void start() {
    _list = _getSlides();
    //  raise change event
    _postEvent();
  }

  @override
  void goNext() {
    _currentIndex--;
    if (_currentIndex < 0) _currentIndex = _list.length - 1;
    _postEvent();
  }

  @override
  void goPrevious() {
    _currentIndex++;
    if (_currentIndex >= _list.length) _currentIndex = 0;
    _postEvent();
  }

  @override
  void onIndexChange(int index) {
    _currentIndex = index;
    _postEvent();
  }

  @override
  Sink get inputOnboardingState => _streamController.sink;

  //  outputs

  @override
  Stream<OnboardingState> get outputOnboardingState =>
      _streamController.stream.map((onboardingViewState) => onboardingViewState);

  //  private operations
  List<SliderState> _getSlides() =>
      [
        SliderState(
            StringsManager.onboardingTitle1, StringsManager.onboardingSubTitle1,
            ImageAssets.onboardingLogo1),
        SliderState(
            StringsManager.onboardingTitle2, StringsManager.onboardingSubTitle2,
            ImageAssets.onboardingLogo2),
        SliderState(
            StringsManager.onboardingTitle3, StringsManager.onboardingSubTitle3,
            ImageAssets.onboardingLogo3),
        SliderState(
            StringsManager.onboardingTitle4, StringsManager.onboardingSubTitle4,
            ImageAssets.onboardingLogo4)
      ];

  void _postEvent() {
    inputOnboardingState.add(OnboardingState(_list[_currentIndex], _list.length, _currentIndex));
  }
}

abstract class OnboardingViewModelInputs {
  void goNext();
  void goPrevious();
  void onIndexChange(int index);

  Sink get inputOnboardingState;
}

abstract class OnboardingViewModelOutputs {
  Stream<OnboardingState> get outputOnboardingState;
}

class OnboardingState {
  SliderState sliderState;
  int slideCount;
  int index;

  OnboardingState(this.sliderState, this.slideCount, this.index);
}