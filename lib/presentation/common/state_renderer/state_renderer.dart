import 'package:flutter/material.dart';
import 'package:mvvm_course/app/constants.dart';
import 'package:mvvm_course/presentation/common/state_renderer/state_renderer_base.dart';
import 'package:mvvm_course/presentation/resources/strings_manager.dart';

abstract class FlowState {
  StateRendererType getStateRendererType();
  String getMessage();
}

class LoadingState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  LoadingState({ required this.stateRendererType, String? message }):
  message = message ?? StringsManager.commonLoading;


  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ErrorState extends FlowState {
  StateRendererType stateRendererType;
  String message;

  ErrorState(this.stateRendererType, this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => stateRendererType;
}

class ContentState extends FlowState {
  ContentState();

  @override
  String getMessage() => Constants.stringEmpty;

  @override
  StateRendererType getStateRendererType() => StateRendererType.content;
}

class EmptyState extends FlowState {
  String message;

  EmptyState(this.message);

  @override
  String getMessage() => message;

  @override
  StateRendererType getStateRendererType() => StateRendererType.empty;
}

extension FlowStateExtension on FlowState {
  Widget getScreenWidget(BuildContext context, Widget content, Function retryAction) {
    switch(runtimeType) {
      case LoadingState: {
        if (getStateRendererType() == StateRendererType.popupLoading) {
          //  popup
          showPopup(context, getStateRendererType(), getMessage());
          return content;
        }
        else {
          //  full screen
          return StateRenderer(stateRendererType: getStateRendererType(), retryAction: retryAction, message: getMessage());
        }
        break;
      }
      case ErrorState: {
        dismissDialog(context);
        if (getStateRendererType() == StateRendererType.popupError) {
          //  popup
          showPopup(context, getStateRendererType(), getMessage());
          return content;
        }
        else {
          //  full screen
          return StateRenderer(stateRendererType: getStateRendererType(), retryAction: retryAction, message: getMessage());
        }
        break;
      }
      case ContentState: {
        dismissDialog(context);
        return content;
        break;
      }
      case EmptyState: {
        return StateRenderer(stateRendererType: getStateRendererType(), retryAction: retryAction, message: getMessage());
        break;
      }
      default:
        return content;
        break;
    }
  }

  void dismissDialog(BuildContext context) {
    if (_dialogShowing(context)) {
      Navigator.of(context, rootNavigator: true).pop(true);
    }
  }

  _dialogShowing(BuildContext context) => ModalRoute.of(context)?.isCurrent != true;

  void showPopup(BuildContext context, StateRendererType stateRendererType, String message) {
    WidgetsBinding.instance?.addPostFrameCallback((_) => showDialog(
        context: context,
        builder: (BuildContext c) => StateRenderer(stateRendererType: stateRendererType, message: message, retryAction: () { })));
  }
}
