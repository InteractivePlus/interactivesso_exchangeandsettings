import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';

class ResendVerificationEmailNotLoggedInRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;

  String userUniqueId;

  String password;

  ResendVerificationEmailNotLoggedInRequest({
    required this.userUniqueId,
    required this.password,
    required this.captchaInfo
  });

  static Map<String,dynamic> staticSerializeWithSettings<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerificationEmailNotLoggedInRequest<CaptchaSerializedInfo, CaptchaInfo> req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'user_unique_id': req.userUniqueId,
      'password': req.password
    };
    ExchangeCaptchaRequiredRequest.appendSerialize(retMap, req, sharedSettings.captchaInfoSerializer);
    return retMap;
  }

  static Map<String,dynamic> staticSerializeWithSettingsGeneral<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerificationEmailNotLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    if(req is ResendVerificationEmailNotLoggedInRequest<CaptchaSerializedInfo, CaptchaInfo>){
      return staticSerializeWithSettings(req, sharedSettings);
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
  
  static ResendVerificationEmailNotLoggedInRequest<CaptchaSerializedInfo, CaptchaInfo> staticDeserialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> reqSerialized,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => ResendVerificationEmailNotLoggedInRequest(
    userUniqueId: reqSerialized['user_unique_id'] as String,
    password: reqSerialized['password'] as String,
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(reqSerialized['captcha_info'])
  );
  
  static List<String>? validate<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerificationEmailNotLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    List<String>? retList = List.empty(growable: true);
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    return retList.isEmpty ? null : retList;
  }
}

final ExchangeFormat<ResendVerificationEmailNotLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerificationEmail_NotLoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'resendVerificationEmail_NotLoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verification_email'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: ResendVerificationEmailNotLoggedInRequest.staticDeserialize, 
  serializeRequest: ResendVerificationEmailNotLoggedInRequest.staticSerializeWithSettingsGeneral, 
  validateRequest: ResendVerificationEmailNotLoggedInRequest.validate,
  parseSuccessResponseData: exchangeVoidToVoidFunction, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: exchangeVoidToVoidFunction, 
  serializeFailedResponseData: exchangeVoidToVoidFunction, 
  requireVerificationCode: false
);