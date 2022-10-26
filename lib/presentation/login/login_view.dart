import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_course/app/constants.dart';
import 'package:mvvm_course/app/di.dart';
import 'package:mvvm_course/data/data_source/remote_data_source.dart';
import 'package:mvvm_course/data/repository/repository.dart';
import 'package:mvvm_course/domain/repository/repository.dart';
import 'package:mvvm_course/domain/use_case/login_use_case.dart';
import 'package:mvvm_course/presentation/resources/assets_manager.dart';
import 'package:mvvm_course/presentation/resources/color_manager.dart';
import 'package:mvvm_course/presentation/resources/values_manager.dart';

import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import 'login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //  fields
  final LoginViewModel _viewModel = instance<LoginViewModel>();
  
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  
  void _bind() {
    _viewModel.start();
    _usernameController.addListener(() => _viewModel.setUsername(_usernameController.text));
    _passwordController.addListener(() => _viewModel.setPassword(_passwordController.text));
  }
  
  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      backgroundColor: ColorManager.bodyBackground,
      body: Container(
        padding: const EdgeInsets.only(top: AppSize.topMarginLogin),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset(ImageAssets.splashLogo),
                const SizedBox(height: AppSize.topMargin),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.contentPadding, right: AppPadding.contentPadding),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.isValidUsername,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _usernameController,
                        decoration: InputDecoration(
                          hintText: StringsManager.hintUsername,
                          labelText: StringsManager.hintUsername,
                          errorText: (snapshot.data ?? false)? Constants.stringEmpty : StringsManager.loginUsernameInvalid,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.topMargin),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.contentPadding, right: AppPadding.contentPadding),
                  child: StreamBuilder<bool >(
                    stream: _viewModel.isValidPassword,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        decoration: InputDecoration(
                          hintText: StringsManager.hintPassword,
                          labelText: StringsManager.hintPassword,
                          errorText: (snapshot.data ?? false)? Constants.stringEmpty : StringsManager.loginPasswordInvalid,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: AppSize.spacing),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.contentPadding, right: AppPadding.contentPadding),
                  child: StreamBuilder<bool>(
                    stream: _viewModel.allInputsValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        height: AppSize.topMargin,
                        child: ElevatedButton(
                            onPressed: (snapshot.data ?? false)
                                ? () { _viewModel.login(); }
                                : null,
                            child: const Text(StringsManager.loginLogin)),
                      );
                    },
                  ),
                ),
                Padding(padding: EdgeInsets.only(
                  top: AppPadding.contentPadding,
                  left: AppPadding.crazyPadding,
                  right: AppPadding.crazyPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.restorablePushReplacementNamed(
                              context, Routes.forgotPasswordRoute);
                        },
                        child: Text(
                          StringsManager.loginForgotPassword,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2,
                        )
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.restorablePushReplacementNamed(
                              context, Routes.registerRoute);
                        },
                        child: Text(
                          StringsManager.loginRegister,
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle2,
                        )
                    )
                  ],
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
