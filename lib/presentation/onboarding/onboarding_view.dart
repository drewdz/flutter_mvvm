import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_course/presentation/resources/assets_manager.dart';
import 'package:mvvm_course/presentation/resources/values_manager.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late final List<SliderState> _list = _getSliderState();
  PageController _controller = PageController(initialPage: 0);
  int _currentIndex = 0;

  List<SliderState> _getSliderState() =>
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

  @override
  Widget build(BuildContext context) {
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
        itemCount: _list.length,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        itemBuilder: (context, index) {
          return OnboardingViewUI(_list[index]);
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
                    Navigator.restorablePushReplacementNamed(context, Routes.loginRoute);
                  }, 
                  child: Text(
                  StringsManager.commonSkip,
                  style: Theme.of(context).textTheme.subtitle2,
                  textAlign: TextAlign.end,
                ))),
            _getBottomSheet()
          ],
        ),
      ),
    );
  }


  Widget _getBottomSheet() {
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
                //  go to previous slide
                _controller.animateToPage(_decrementIndex(), duration: AppDuration.onboardingSlide, curve: Curves.easeInOut);
              },
            ),
          ),
          //  page indicator
          Row(
            children: [
              for(int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.contentPadding),
                  child: _getPageIndicator(i),
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
                  //  go to next slide
                  _controller.animateToPage(_incrementIndex(), duration: AppDuration.onboardingSlide, curve: Curves.easeInOut);
                }),
          ),
        ],
      ),
    );
  }

  int _decrementIndex() {
    _currentIndex--;
    if (_currentIndex < 0) _currentIndex = _list.length - 1;
    return _currentIndex;
  }

  int _incrementIndex() {
    _currentIndex++;
    if (_currentIndex >= _list.length) _currentIndex = 0;
    return _currentIndex;
  }

  Widget _getPageIndicator(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.circleOpen);
    }
    else{
      return SvgPicture.asset(ImageAssets.circleFilled);
    }
  }
}

class OnboardingViewUI extends StatelessWidget {
  SliderState _sliderState;
  OnboardingViewUI(this._sliderState, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: AppSize.topMargin),
        Padding(
          padding: const EdgeInsets.all(AppPadding.headingPadding),
          child: Text(
            _sliderState.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline1),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.headingPadding),
          child: Text(
              _sliderState.subTitle,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle1),
        ),
        const SizedBox(height: AppSize.onboardingSpace),
        SvgPicture.asset(_sliderState.image)
      ],
    );
  }
}


class SliderState {
  String title;
  String subTitle;
  String image;

  SliderState(this.title, this.subTitle, this.image);
}
