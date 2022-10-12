import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_course/presentation/resources/assets_manager.dart';
import 'package:mvvm_course/presentation/resources/values_manager.dart';

import '../../domain/model.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import 'onboarding_view_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  PageController _controller = PageController(initialPage: 0);
  OnboardingViewModel _viewModel = OnboardingViewModel();

  @override
  void initState() {
    //  start the view model
    _viewModel.start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<OnboardingState>(
      stream: _viewModel.outputOnboardingState,
      builder: (context, snapShot) {
        return _getContentWidget(snapShot.data);
      }
    );
  }

  Widget _getContentWidget(OnboardingState? state) {
    if (state == null) {
        return Container();
      }
      else {
      return Scaffold(
        backgroundColor: ColorManager.bodyBackground,
        appBar: AppBar(
          backgroundColor: ColorManager.bodyBackground,
          elevation: AppSize.appBarElevation,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: ColorManager.appBar,
              statusBarBrightness: Brightness.dark,
              statusBarIconBrightness: Brightness.dark
          ),

        ),
        body: PageView.builder(
          controller: _controller,
          itemCount: state.slideCount,
          onPageChanged: _viewModel.onIndexChange,
          itemBuilder: (context, index) {
            return OnboardingViewUI(state.sliderState);
          },
        ),
        bottomSheet: Container(
          color: ColorManager.bodyBackground,
          height: AppSize.bottomSheet,
          child: Column(
            children: [
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {
                        Navigator.restorablePushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      child: Text(
                        StringsManager.commonSkip,
                        style: Theme
                            .of(context)
                            .textTheme
                            .subtitle2,
                        textAlign: TextAlign.end,
                      ))),
              _getBottomSheet(state)
            ],
          ),
        ),
      );
    }
  }

  Widget _getBottomSheet(OnboardingState state) {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //  left chevron
          Padding(
            padding: EdgeInsets.all(AppPadding.bottomSheet),
            child: GestureDetector(
              child: SizedBox(
                height: AppSize.bottomSheetClick,
                width: AppSize.bottomSheetClick,
                child: SvgPicture.asset(ImageAssets.chevronLeft),
              ),
              onTap: () {
                //  TODO: go to previous slide
              },
            ),
          ),
          //  page indicator
          Row(
            children: [
              for(int i = 0; i < state.slideCount; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.contentPadding),
                  child: _getPageIndicator(i, state.index),
                )
            ],
          ),
          //  right chevron
          Padding(
            padding: const EdgeInsets.all(AppPadding.bottomSheet),
            child: GestureDetector(
                child: SizedBox(
                  height: AppSize.bottomSheetClick,
                  width: AppSize.bottomSheetClick,
                  child: SvgPicture.asset(ImageAssets.chevronRight),
                ),
                onTap: () {
                  //  TODO: go to next slide
                }),
          ),
        ],
      ),
    );
  }

  Widget _getPageIndicator(int index, int currentIndex) {
    if (index == currentIndex) {
      return SvgPicture.asset(ImageAssets.circleOpen);
    }
    else{
      return SvgPicture.asset(ImageAssets.circleFilled);
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

class OnboardingViewUI extends StatelessWidget {
  final SliderState _state;

  OnboardingViewUI(this._state, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.topMargin),
        Padding(
          padding: const EdgeInsets.all(AppPadding.headingPadding),
          child: Text(
            _state.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.headingPadding),
          child: Text(
              _state.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
        const SizedBox(height: AppSize.onboardingSpace),
        SvgPicture.asset(_state.image)
      ],
    );
  }
}
