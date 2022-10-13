//  map an API response to a non-nullable model
//  data layer -> domain layer

import 'package:mvvm_course/app/extensions.dart';
import 'package:mvvm_course/data/responses/responses.dart';
import 'package:mvvm_course/domain/model/model.dart';

import '../../app/constants.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() {
    return Customer(
        this?.id?.orEmpty() ?? Constants.stringEmpty,
        this?.name?.orEmpty() ?? Constants.stringEmpty,
        this?.numberOfNotifications?.orZero() ?? Constants.intZero);
  }
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() {
    return Contacts(
        this?.phone?.orEmpty() ?? Constants.stringEmpty,
        this?.link?.orEmpty() ?? Constants.stringEmpty,
        this?.email?.orEmpty() ?? Constants.stringEmpty);
  }
}

extension LoginResponseMapper on LoginResponse? {
  Login toDomain() {
    return Login(
        this?.customer?.toDomain(), this?.contacts?.toDomain());
  }
}


