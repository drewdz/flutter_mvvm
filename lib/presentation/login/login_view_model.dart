import 'dart:async';

import 'package:mvvm_course/domain/model/model.dart';
import 'package:mvvm_course/domain/use_case/login_use_case.dart';
import 'package:mvvm_course/presentation/base_view_model.dart';
import 'package:mvvm_course/presentation/common/freezed_data.dart';

class LoginViewModel
    extends BaseViewModel
    with LoginViewModelInputs, LoginViewModelOutputs
{
  //  fields
  StreamController _usernameStream = StreamController<String>.broadcast();
  StreamController _passwordStream = StreamController<String>.broadcast();

  var loginFreezed = LoginFreezed("", "");
  //  TODO: remove nullable
  final LoginUseCase? _loginUseCase;
  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _usernameStream.close();
    _passwordStream.close();
  }

  @override
  void start() {
  }

  //  inputs
  @override
  // TODO: implement inputPassword
  Sink get inputPassword => _passwordStream.sink;

  @override
  // TODO: implement inputUsername
  Sink get inputUsername => _usernameStream.sink;

  @override
  void login() async {
    (await _loginUseCase.execute(LoginUseCaseInput(loginFreezed.username, loginFreezed.password)))
      .fold((failure) => {
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
  }

  @override
  void setUsername(String username) {
    inputUsername.add(username);
    loginFreezed = loginFreezed.copyWith(username: username);
  }

  //  outputs
  @override
  Stream<bool> get isValidPassword => _passwordStream.stream.map((password) => _passwordIsValid(password));

  @override
  Stream<bool> get isValidUsername => _usernameStream.stream.map((username) => _usernameIsValid(username));

  //  operations
  bool _passwordIsValid(String password) {
    //  TODO: refactor this as reusable code
    return password.isNotEmpty;
  }

  bool _usernameIsValid(String username) {
    //  TODO: refactor this as reusable code
    return username.isNotEmpty;
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
}

abstract class LoginViewModelOutputs {
  //  TODO: are these additional classes needed? Potentially collapse into view model
  //  streams
  Stream<bool> get isValidUsername;
  Stream<bool> get isValidPassword;
}