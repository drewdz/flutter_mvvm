import 'package:json_annotation/json_annotation.dart';
import 'package:mvvm_course/data/responses/service_response.dart';

part 'responses.g.dart';

@JsonSerializable()
class CustomerResponse  {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name;

  @JsonKey(name: "numberOfNotifications")
  int? numberOfNotifications;

  CustomerResponse(this.id, this.name, this.numberOfNotifications);

  //  from Json
  factory CustomerResponse.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponseFromJson(json);

  //  to Json
  Map<String, dynamic> toJson() => _$CustomerResponseToJson(this);
}

@JsonSerializable()
class ContactsResponse {
  @JsonKey(name: "phone")
  String? phone;

  @JsonKey(name: "link")
  String? link;

  @JsonKey(name: "email")
  String? email;

  ContactsResponse(this.phone, this.link, this.email);

  //  from Json
  factory ContactsResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseFromJson(json);

  //  to Json
  Map<String, dynamic> toJson() => _$ContactsResponseToJson(this);
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "customer")
  CustomerResponse? customer;

  @JsonKey(name: "contacts")
  ContactsResponse? contacts;

  LoginResponse(this.customer, this.contacts);

  //  from Json
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  //  to Json
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}