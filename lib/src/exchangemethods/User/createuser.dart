import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'createuser.g.dart';

@JsonSerializable(includeIfNull: false)
class CreateUserAPIRequest{
  @JsonKey(required: true, name: 'username')
  String username;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(name: 'phone')
  @NullablePhoneNumberConverter()
  String? phoneNumber;

  @JsonKey(required:true, name: 'password')
  String password;

  @JsonKey(name: 'area')
  String? areaAlpha2Code;

  @JsonKey(name: 'locale')
  String? localeCode;

  CreateUserAPIRequest({
    required this.username,
    this.email,
    this.phoneNumber,
    required this.password,
    this.areaAlpha2Code,
    this.localeCode
  });

}

const ExchangeFormat CreateUserAPI;