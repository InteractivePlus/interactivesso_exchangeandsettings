import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

part 'get_reset_password_vericode.g.dart';

class GetResetPasswordVericodeRequest<CaptchaSerializedInfo, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>> implements ExchangeCaptchaRequiredRequest<CaptchaSerializedInfo, CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;
  
  String? username;

  String? email;

  PhoneNumber? phoneNumber;
  
  GetResetPasswordVericodeRequest({
    required this.captchaInfo,
    this.username,
    this.email,
    this.phoneNumber
  });

  static Map<String,dynamic> staticSerializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    GetResetPasswordVericodeRequest req,
    FineSetting sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'captcha_info': sharedSettings.captchaInfoSerializer.serialize(req.captchaInfo)
    };
    if(req.username != null){
      retMap['username']  = req.username;
    }
    if(req.email != null){
      retMap['email'] = req.email;
    }
    if(req.phoneNumber != null){
      retMap['phone'] = NullablePhoneNumberConverter().toJson(req.phoneNumber);
    }
    return retMap;
  }
  static GetResetPasswordVericodeRequest staticDeserializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> serialized,
    FineSetting sharedSettings
  ) => GetResetPasswordVericodeRequest(
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(serialized['captcha_info']),
    username: serialized['username'] as String?,
    email: serialized['email'] as String?,
    phoneNumber: NullablePhoneNumberConverter().fromJson(serialized['phone'] as String?)
  );
  static List<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    GetResetPasswordVericodeRequest req,
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

@JsonSerializable(includeIfNull: false)
class GetResetPasswordVericodeSuccessfulData{
  @JsonKey(required: true, name: 'sent_method', fromJson: CommunicationMethod.fromJson, toJson: Serializable.convertToDynamicSerialized)
  CommunicationMethod sentMethod;

  String? email;

  @NullablePhoneNumberConverter()
  PhoneNumber? phone;

  GetResetPasswordVericodeSuccessfulData({
    required this.sentMethod,
    this.email,
    this.phone
  });
  factory GetResetPasswordVericodeSuccessfulData.fromJson(Map<String,dynamic> json) => _$GetResetPasswordVericodeSuccessfulDataFromJson(json);
  Map<String,dynamic> toJson() => _$GetResetPasswordVericodeSuccessfulDataToJson(this);

  static Map<String,dynamic> staticSerialize(GetResetPasswordVericodeSuccessfulData o) => o.toJson();
  static GetResetPasswordVericodeSuccessfulData staticDeserialize(Map<String,dynamic> json) => GetResetPasswordVericodeSuccessfulData.fromJson(json);
  static List<String>? validate(GetResetPasswordVericodeSuccessfulData o){
    List<String> retList = List.empty(growable: true);
    if(o.sentMethod.verifyTarget == PhoneOrEmail.email){
      if(o.email == null){
        retList.add('email');
      }
      if(o.phone != null){
        retList.add('phone');
      }
    }else{
      if(o.phone == null){
        retList.add('phone');
      }
      if(o.email != null){
        retList.add('email');
      }
    }
    return retList.isEmpty ? null : retList;
  }
  static bool validateBoolean(GetResetPasswordVericodeSuccessfulData o) => validate(o) == null;
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(validateBoolean);
}

InteractiveSSOExchangeFormat<GetResetPasswordVericodeRequest,GetResetPasswordVericodeSuccessfulData,void,Map<String,dynamic>,Map<String,dynamic>,void> getResetPasswordVericodeAPI = ExchangeFormat(
  exchangeProtocolName: 'getResetPasswordVericodeAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201,400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/verfication_messages/forgot_password'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: GetResetPasswordVericodeRequest.staticDeserializeWithSettings, 
  serializeRequest: GetResetPasswordVericodeRequest.staticSerializeWithSettings, 
  validateRequest: GetResetPasswordVericodeRequest.staticValidateWithSettings, 
  parseSuccessResponseData: GetResetPasswordVericodeSuccessfulData.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: GetResetPasswordVericodeSuccessfulData.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  validateResponseDataSuccess: GetResetPasswordVericodeSuccessfulData.staticValidateWithSettings,
  requireVerificationCode: false
);