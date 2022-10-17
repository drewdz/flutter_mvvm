import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezed_data.freezed.dart';

@freezed
class LoginFreezed with _$LoginFreezed {
  factory LoginFreezed(String username, String password) = _LoginFreezed;
}