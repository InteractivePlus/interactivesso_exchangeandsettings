import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returneduserentity.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

part 'login.g.dart';

class UserLoginAPIRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;
  
  String? username;

  String? email;

  PhoneNumber? phoneNumber;

  String password;

  UserLoginAPIRequest({
    required this.captchaInfo,
    this.username,
    this.email,
    this.phoneNumber,
    required this.password
  });

  static Map<String,dynamic> serializeStaticWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    UserLoginAPIRequest req,
    FineSetting sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'password': req.password
    };
    if(req.email != null){
      retMap['email'] = req.email;
    }
    if(req.username != null){
      retMap['username'] = req.username;
    }
    if(req.phoneNumber != null){
      retMap['phone'] = NullablePhoneNumberConverter().toJson(req.phoneNumber);
    }
    ExchangeCaptchaRequiredRequest.appendSerializeWithSetting(retMap, req, sharedSettings);
    return retMap;
  }

  static UserLoginAPIRequest deserializeStaticWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> reqSerialized,
    FineSetting sharedSettings
  ) => UserLoginAPIRequest(
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(reqSerialized['captcha_info']), 
    password: reqSerialized['password'] as String,
    phoneNumber: NullablePhoneNumberConverter().fromJson(reqSerialized['phone'] as String?),
    username: reqSerialized['username'] as String?,
    email: reqSerialized['email'] as String?
  );

  static List<String>? validateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    UserLoginAPIRequest req,
    FineSetting sharedSettings
  ){
    List<String> retList = List.empty(growable: true);
    if(req.email != null && !sharedSettings.validatorSettings.userSystemValidators.emailValidator.validate(req.email!)){
      retList.add('email');
    }
    if(req.username != null && !sharedSettings.validatorSettings.userSystemValidators.usernameValidator.validate(req.username!)){
      retList.add('username');
    }
    if(req.phoneNumber != null && !req.phoneNumber!.validate()){
      retList.add('phone');
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    // Check only one user identifier(email, username, phoneNumber) is used.
    {
      int nonNullUserIdentifierCount = 0;
      if(req.email != null){
        nonNullUserIdentifierCount++;
      }
      if(req.username != null){
        nonNullUserIdentifierCount++;
      }
      if(req.phoneNumber != null){
        nonNullUserIdentifierCount++;
      }
      if(nonNullUserIdentifierCount == 0 || nonNullUserIdentifierCount > 1){
        if(!retList.contains('phone')){
          retList.add('phone');
        }
        if(!retList.contains('username')){
          retList.add('username');
        }
        if(!retList.contains('email')){
          retList.add('email');
        }
      }
    }
    return retList.isEmpty ? null : retList;
  }
}

@JsonSerializable()
class UserLoginSuccessfulAPIResponseData implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'user_token')
  ExchangedReturnedUserToken userToken;

  @JsonKey(required: true, name: 'user_info')
  ExchangedUserEntity userInfo;

  UserLoginSuccessfulAPIResponseData({
    required this.userInfo,
    required this.userToken
  });
  factory UserLoginSuccessfulAPIResponseData.fromMap(Map<String,dynamic> map) => _$UserLoginSuccessfulAPIResponseDataFromJson(map);
  static UserLoginSuccessfulAPIResponseData fromJson(Map<String,dynamic> json) => UserLoginSuccessfulAPIResponseData.fromMap(json);
  static UserLoginSuccessfulAPIResponseData? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  static Map<String,dynamic> staticSerialize(UserLoginSuccessfulAPIResponseData obj) => obj.serialize();

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(fromJson);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserLoginSuccessfulAPIResponseDataToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

@JsonSerializable()
class UserLoginFailedAPIResponseData implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'user_info')
  ExchangedUserEntity? userInfoDueToNotVerifiedAccount;

  UserLoginFailedAPIResponseData({
    required this.userInfoDueToNotVerifiedAccount,
  });
  factory UserLoginFailedAPIResponseData.fromMap(Map<String,dynamic> map) => _$UserLoginFailedAPIResponseDataFromJson(map);
  static UserLoginFailedAPIResponseData fromJson(Map<String,dynamic> json) => UserLoginFailedAPIResponseData.fromMap(json);
  static UserLoginFailedAPIResponseData? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  static Map<String,dynamic> staticSerialize(UserLoginFailedAPIResponseData obj) => obj.serialize();

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(fromJson);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$UserLoginFailedAPIResponseDataToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

InteractiveSSOExchangeFormat<UserLoginAPIRequest, UserLoginSuccessfulAPIResponseData, UserLoginFailedAPIResponseData, Map<String,dynamic>, Map<String,dynamic>, Map<String,dynamic>> userLoginAPI = ExchangeFormat(
  exchangeProtocolName: 'userLoginAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/token'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 4,
    numRequestPerUserPerMin: 4
  ), 
  parseRequest: UserLoginAPIRequest.deserializeStaticWithSettings, 
  serializeRequest: UserLoginAPIRequest.serializeStaticWithSettings, 
  validateRequest: UserLoginAPIRequest.validateWithSettings,
  parseSuccessResponseData: UserLoginSuccessfulAPIResponseData.staticDeserializeWithSettings, 
  parseFailedResponseData: UserLoginFailedAPIResponseData.staticDeserializeWithSettings, 
  serializeSuccessResponseData: UserLoginSuccessfulAPIResponseData.staticSerializeWithSettings, 
  serializeFailedResponseData: UserLoginFailedAPIResponseData.staticSerializeWithSettings, 
  requireVerificationCode: false
);