import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

import '../CommonTypes/captcharequiredrequest.dart';
import '../CommonTypes/returneduserentity.dart';
import '../../interface/exchangeformat.dart';


part 'createuser.g.dart';

typedef CreateUserAPIRequestSerialized = Map<String,dynamic>;

class CreateUserAPIRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements InternationalizedExchangeRequest, ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  String username;

  String? email;

  PhoneNumber? phoneNumber;

  String password;

  String? areaAlpha2Code;

  @override
  CaptchaInfo captchaInfo;

  @override
  String? preferredLocale;

  CreateUserAPIRequest({
    this.preferredLocale,
    required this.username,
    this.email,
    this.phoneNumber,
    required this.password,
    this.areaAlpha2Code,
    required this.captchaInfo
  });

  static Map<String,dynamic> staticSerializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    CreateUserAPIRequest request, 
    FineSetting sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'username': request.username,
      'password': request.password,
      'captcha_info': sharedSettings.captchaInfoSerializer.serialize(request.captchaInfo)
    };
    if(request.email != null){
      retMap['email'] = request.email;
    }
    if(request.phoneNumber != null){
      retMap['phone'] = NullablePhoneNumberConverter().toJson(request.phoneNumber);
    }
    if(request.areaAlpha2Code != null){
      retMap['area'] = request.areaAlpha2Code;
    }
    if(request.preferredLocale != null){
      retMap['preferred_locale'] = request.preferredLocale;
    }
    return retMap;
  }

  static CreateUserAPIRequest staticDeserializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> serialized, 
    FineSetting sharedSettings
  ){
    return CreateUserAPIRequest(
      username: serialized['username'] as String, 
      password: serialized['password'] as String, 
      captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(serialized['captcha_info']),
      preferredLocale: serialized['preferred_locale'] as String?,
      email: serialized['email'] as String?,
      phoneNumber: NullablePhoneNumberConverter().fromJson(serialized['phone'] as String?),
      areaAlpha2Code: serialized['area'] as String?
    );
  }
  static Set<String>? validate<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    CreateUserAPIRequest request, 
    FineSetting sharedSettings
  ){
    Set<String> returnList = {};
    var userSystemValidators = sharedSettings.validatorSettings.userSystemValidators;
    if(!userSystemValidators.usernameValidator.validate(request.username)){
      returnList.add('username');
    }
    if(request.email != null && !userSystemValidators.emailValidator.validate(request.email!)){
      returnList.add('email');
    }
    if(request.phoneNumber != null && !request.phoneNumber!.validate()){
      returnList.add('phone');
    }
    if(request.email == null && request.phoneNumber == null){
      if(!returnList.contains('email')){
        returnList.add('email');
      }
      if(!returnList.contains('phone')){
        returnList.add('phone');
      }
    }
    if(!userSystemValidators.passwordFormatValidator.validate(request.password)){
      returnList.add('password');
    }
    List<String>? internationalizedReturn = InternationalizedExchangeRequest.validateWithSettings(request, sharedSettings);
    if(internationalizedReturn != null){
      returnList.addAll(internationalizedReturn);
    }
    if(returnList.isEmpty){
      return null;
    }else{
      return returnList;
    }
  }
}

@JsonSerializable(includeIfNull: false)
class CreateUserSuccessResponse implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'phone_sent_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? phoneVerificationMethod;

  @JsonKey(name: 'email_sent_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? emailVerificationMethod;

  @JsonKey(required:true, name: 'created_user')
  ExchangedUserEntity createdUserInfo;

  CreateUserSuccessResponse({
    required this.createdUserInfo,
    this.phoneVerificationMethod,
    this.emailVerificationMethod
  });

  factory CreateUserSuccessResponse.fromMap(Map<String,dynamic> map) => _$CreateUserSuccessResponseFromJson(map);
  static CreateUserSuccessResponse fromJson(Map<String,dynamic> json) => CreateUserSuccessResponse.fromMap(json);
  static CreateUserSuccessResponse? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  static Map<String,dynamic> staticSerialize<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    CreateUserSuccessResponse res, 
    FineSetting sharedSettings
  ) => res.toJson();

  static CreateUserSuccessResponse staticDeserialize<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> serialized, 
    FineSetting sharedSettings
  ) => CreateUserSuccessResponse.fromJson(serialized);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$CreateUserSuccessResponseToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

///If there's something like email / phone / username already used, make sure you throw the appropriate exception with valid parameters.
///This also causes the backend to send verification codes to the user, the user can verify their email / phone using the verification code
///After finishing registration, the frontend should prompt the user to enter verification code for phone and email.
final InteractiveSSOExchangeFormat<CreateUserAPIRequest, CreateUserSuccessResponse, void, Map<String,dynamic>, Map<String,dynamic>, void> createUserAPI = 
ExchangeFormat(
  exchangeProtocolName: 'createUserAPI', 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5
  ),
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 409, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<username>'
  ), 
  requireVerificationCode: false,
  parseRequest: CreateUserAPIRequest.staticDeserializeWithSettings, 
  serializeRequest: CreateUserAPIRequest.staticSerializeWithSettings, 
  validateRequest: CreateUserAPIRequest.validate,
  parseSuccessResponseData: CreateUserSuccessResponse.staticDeserialize, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: CreateUserSuccessResponse.staticSerialize, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc
);