import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/validatorsbysystem/usersystem.dart';
import 'package:json_annotation/json_annotation.dart';

part 'createuser.g.dart';

typedef CreateUserAPIRequestSerialized = Map<String,dynamic>;

@JsonSerializable(includeIfNull: false)
class CreateUserAPIRequest extends InternationalilzedExchangeRequest implements Serializable<Map<String,dynamic>>{
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
    String? preferredLocale,
    required this.username,
    this.email,
    this.phoneNumber,
    required this.password,
    this.areaAlpha2Code,
    this.localeCode
  }) : super(preferredLocale: preferredLocale);

  factory CreateUserAPIRequest.fromMap(Map<String,dynamic> map) => _$CreateUserAPIRequestFromJson(map);
  static CreateUserAPIRequest fromJson(Map<String,dynamic> json) => CreateUserAPIRequest.fromMap(json);
  static CreateUserAPIRequest? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    CreateUserAPIRequest request, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => request.serialize();
  static CreateUserAPIRequest staticDeserialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    Map<String,dynamic> serialized, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => CreateUserAPIRequest.fromMap(serialized);
  static List<String>? validate<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    CreateUserAPIRequest request, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    List<String> returnList = List.empty(growable: true);
    UserSystemValidators userSystemValidators = sharedSettings.validatorSettings.userSystemValidators;
    if(!userSystemValidators.usernameValidator.validate(request.username)){
      returnList.add('username');
    }
    if(request.email != null && !userSystemValidators.emailValidator.validate(request.email!)){
      returnList.add('email');
    }
    if(!userSystemValidators.passwordFormatValidator.validate(request.password)){
      returnList.add('password');
    }
    List<String>? internationalizedReturn = InternationalilzedExchangeRequest.validate(request, sharedSettings);
    if(internationalizedReturn != null){
      returnList.addAll(internationalizedReturn);
    }
    if(returnList.isEmpty){
      return null;
    }else{
      return returnList;
    }
  }

  @override
  Map<String, dynamic> serialize([String? locale]) => _$CreateUserAPIRequestToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}


///If there's something like email / phone / username already used, make sure you throw the appropriate exception with valid parameters.
final ExchangeFormat<CreateUserAPIRequest, void, void, Map<String,dynamic>, void, void> CreateUserAPI = 
ExchangeFormat(
  exchangeProtocolName: 'createUserAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 409], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<username>'
  ), 
  parseRequest: CreateUserAPIRequest.staticDeserialize, 
  serializeRequest: CreateUserAPIRequest.staticSerialize, 
  validateRequest: CreateUserAPIRequest.validate,
  parseSuccessResponseData: (obj, setting) => null, 
  parseFailedResponseData: (obj, setting) => null, 
  serializeSuccessResponseData: (obj, setting) => null, 
  serializeFailedResponseData: (obj, setting) => null
);