import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/validatorsbysystem/usersystem.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

part 'createuser.g.dart';

typedef CreateUserAPIRequestSerialized = Map<String,dynamic>;

class CreateUserAPIRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements InternationalilzedExchangeRequest, ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  String username;

  String? email;

  PhoneNumber? phoneNumber;

  String password;

  String? areaAlpha2Code;

  String? localeCode;

  @override
  CaptchaInfo captchaInfo;

  @override
  String? preferredLocale;

  CreateUserAPIRequest({
    String? preferredLocale,
    required this.username,
    this.email,
    this.phoneNumber,
    required this.password,
    this.areaAlpha2Code,
    this.localeCode,
    required this.captchaInfo
  });

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    CreateUserAPIRequest<CaptchaSerializedInfo, CaptchaInfo> request, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
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
    if(request.localeCode != null){
      retMap['locale'] = request.localeCode;
    }
    if(request.preferredLocale != null){
      retMap['preferred_locale'] = request.preferredLocale;
    }
    return retMap;
  }

  static Map<String,dynamic> staticSerializeGeneral<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    CreateUserAPIRequest request, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    if(request is CreateUserAPIRequest<CaptchaSerializedInfo, CaptchaInfo>){
      return staticSerialize(request, sharedSettings);
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  static CreateUserAPIRequest<CaptchaSerializedInfo, CaptchaInfo> staticDeserialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    Map<String,dynamic> serialized, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    return CreateUserAPIRequest<CaptchaSerializedInfo, CaptchaInfo>(
      username: serialized['username'] as String, 
      password: serialized['password'] as String, 
      captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(serialized['captcha_info']),
      preferredLocale: serialized['preferred_locale'] as String?,
      email: serialized['email'] as String?,
      phoneNumber: NullablePhoneNumberConverter().fromJson(serialized['phone'] as String?),
      areaAlpha2Code: serialized['area'] as String?,
      localeCode: serialized['locale'] as String?
    );
  }
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
}

@JsonSerializable(includeIfNull: false)
class CreateUserSuccessResponse implements Serializable<Map<String,dynamic>>{
  @JsonKey(name: 'phone_sent_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? phoneVerificationMethod;

  @JsonKey(name: 'email_sent_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? emailVerificationMethod;

  CreateUserSuccessResponse({
    this.phoneVerificationMethod,
    this.emailVerificationMethod
  });

  factory CreateUserSuccessResponse.fromMap(Map<String,dynamic> map) => _$CreateUserSuccessResponseFromJson(map);
  static CreateUserSuccessResponse fromJson(Map<String,dynamic> json) => CreateUserSuccessResponse.fromMap(json);
  static CreateUserSuccessResponse? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    CreateUserSuccessResponse res, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => res.toJson();

  static CreateUserSuccessResponse staticDeserialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    Map<String,dynamic> serialized, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => CreateUserSuccessResponse.fromJson(serialized);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$CreateUserSuccessResponseToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

///If there's something like email / phone / username already used, make sure you throw the appropriate exception with valid parameters.
final ExchangeFormat<CreateUserAPIRequest, CreateUserSuccessResponse, void, Map<String,dynamic>, Map<String,dynamic>, void> CreateUserAPI = 
ExchangeFormat(
  exchangeProtocolName: 'createUserAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 409, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<username>'
  ), 
  requireVerificationCode: false,
  parseRequest: CreateUserAPIRequest.staticDeserialize, 
  serializeRequest: CreateUserAPIRequest.staticSerializeGeneral, 
  validateRequest: CreateUserAPIRequest.validate,
  parseSuccessResponseData: CreateUserSuccessResponse.staticDeserialize, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: CreateUserSuccessResponse.staticSerialize, 
  serializeFailedResponseData: exchangeVoidToVoidFunction
);