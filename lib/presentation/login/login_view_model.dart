import 'dart:async';

import 'package:mvvm_course/domain/model/model.dart';
import 'package:mvvm_course/domain/use_case/login_use_case.dart';
import 'package:mvvm_course/presentation/base/base_view_model.dart';
import 'package:mvvm_course/presentation/common/freezed_data.dart';
import 'package:mvvm_course/presentation/common/state_renderer/state_renderer.dart';
import 'package:mvvm_course/presentation/resources/strings_manager.dart';

import '../../app/constants.dart';

class LoginViewModel
    extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs
{
  //  fields
  final StreamController _usernameStream = StreamController<String>.broadcast();
  final StreamController _passwordStream = StreamController<String>.broadcast();
  final StreamController _allInputsValid = StreamController<void>.broadcast();

  var loginFreezed = LoginFreezed("", "");
  //  TODO: remove nullable
  final LoginUseCase _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _usernameStream.close();
    _passwordStream.close();
    _allInputsValid.close();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  //  inputs
  @override
  Sink get inputPassword => _passwordStream.sink;

  @override
  Sink get inputUsername => _usernameStream.sink;

  @override
  Sink get inputsValid => _allInputsValid.sink;

  @override
  void login() async {
    (await _loginUseCase?.execute(LoginUseCaseInput(loginFreezed.username, loginFreezed.password)))
      ?.fold((failure) => {
        //  left - failure
        print(failure.message)
    }, (data) => {
          //  right - success
        print(data.customer?.name)
    });
  }

  @override
  void setPassword(String password) {
    inputPassword.add(password);
    loginFreezed = loginFreezed.copyWith(password: password); // same as kotlin - only updates supplied value
    _validate();
  }

  @override
  void setUsername(String username) {
    inputUsername.add(username);
    loginFreezed = loginFreezed.copyWith(username: username);
    _validate();
  }

  //  outputs
  @override
  Stream<bool> get isValidPassword => _passwordStream.stream.map((password) => _passwordIsValid(password));

  @override
  Stream<bool> get isValidUsername => _usernameStream.stream.map((username) => _usernameIsValid(username));

  @override
  Stream<bool> get allInputsValid => _allInputsValid.stream.map((_) => _inputsAllValid());

  //  operations
  bool _passwordIsValid(String password) {
    //  TODO: refactor this as reusable code
    return password.isNotEmpty;
  }

  bool _usernameIsValid(String username) {
    //  TODO: refactor this as reusable code
    return username.isNotEmpty;
  }

  bool _inputsAllValid() {
    var b = _passwordIsValid(loginFreezed.password) && _usernameIsValid(loginFreezed.username);
    return b;
  }

  void _validate() {
    inputsValid.add(null);
  }
}

abstract class LoginViewModelInputs {
  //  TODO: are these additional classes needed? Potentially collapse into view model
  //  operations
  void setUsername(String username);

  void setPassword(String password);

  void login();

  //  sinks
  Sink get inputUsername;

  Sink get inputPassword;

  Sink get inputsValid;
}

abstract class LoginViewModelOutputs {
  //  TODO: are these additional classes needed? Potentially collapse into view model
  //  streams
  Stream<bool> get isValidUsername;
  Stream<bool> get isValidPassword;
  Stream<bool> get allInputsValid;
}