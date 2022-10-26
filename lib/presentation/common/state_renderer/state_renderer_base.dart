import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mvvm_course/app/constants.dart';
import 'package:mvvm_course/presentation/resources/assets_manager.dart';
import 'package:mvvm_course/presentation/resources/color_manager.dart';
import 'package:mvvm_course/presentation/resources/font_manager.dart';
import 'package:mvvm_course/presentation/resources/strings_manager.dart';

import '../../../data/network/failure.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

enum StateRendererType {
  //  popup states
  popupLoading,
  popupError,
  //  full screen states
  loading,
  error,
  content,
  empty
}

class StateRenderer extends StatelessWidget {
  final StateRendererType stateRendererType;
  final String message;
  final String title;
  final Function? retryAction;

  StateRenderer({
        Key? key,
        required this.stateRendererType,
        Failure? failure,
        String? message,
        String? title,
        required this.retryAction }) :
        message = message ?? StringsManager.commonLoading,
        title = title ?? Constants.stringEmpty,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return _getStateWidget(context);
  }

  Widget _getStateWidget(BuildContext context) {
    switch(stateRendererType) {
      case StateRendererType.popupLoading:
        return _getPopup(context, [ _getAnimatedImage(JsonAssets.loading)]);
        break;
      case StateRendererType.popupError:
        return _getPopup(context, [ _getAnimatedImage(JsonAssets.error), _getMessage(message), _getRetryButton(context, StringsManager.stateErrorDismiss)]);
        break;
      case StateRendererType.loading:
        return _getItems([ _getAnimatedImage(JsonAssets.loading), _getMessage(message) ]);
        break;
      case StateRendererType.error:
        return _getItems([ _getAnimatedImage(JsonAssets.error), _getMessage(message), _getRetryButton(context, StringsManager.stateErrorRetry) ]);
        break;
      case StateRendererType.content:
        return Container();
        break;
      case StateRendererType.empty:
        return _getItems([ _getAnimatedImage(JsonAssets.empty), _getMessage(message) ]);
        break;
      default:
        return Container();
    }
  }
  
  Widget _getPopup(BuildContext context, List<Widget> children) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppSize.borderRadius)
      ),
      elevation: AppSize.statePopupElevation,
      backgroundColor: ColorManager.statePopupBackground,
      child: Container(
        decoration: BoxDecoration(
          color: ColorManager.bodyBackground,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(AppSize.borderRadius),
          boxShadow: [
            BoxShadow(
                color: ColorManager.statePopupBackground,
                blurRadius: AppSize.statePopupBlurRadius,
                offset: const Offset(AppSize.statePopupOffsetX, AppSize.statePopupOffsetY))
          ]
        ),
        child: _getPopupContent(context, children),
      ),
    );
  }

  Widget _getPopupContent(BuildContext context, List<Widget> children) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  Widget _getAnimatedImage(String animation) {
    return SizedBox(
      height: AppSize.stateImage,
      width: AppSize.stateImage,
      child: Lottie.asset(animation)
    );
  }

  Widget _getMessage(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.stateMessage),
        child: Text(message, style: getMediumStyle(fontColor: ColorManager.stateMessage, fontSize: FontSizeConstants.stateMessage)),
      ),
    );
  }

  Widget _getRetryButton(BuildContext context, String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.stateButton),
        child: SizedBox(
          width: AppSize.stateButtonWidth,
          child: ElevatedButton(
              onPressed: () {
                if (stateRendererType == StateRendererType.error) {
                  retryAction?.call();
                }
                //  always dismiss the error
                Navigator.of(context).pop();
              },
              child: Text(text)),
        ),
      ),
    );
  }

  Widget _getItems(List<Widget> children) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}