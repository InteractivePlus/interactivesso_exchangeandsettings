import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
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

  static Map<String,dynamic> staticSerializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    ResendVerificationEmailNotLoggedInRequest req,
    FineSetting sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'user_unique_id': req.userUniqueId,
      'password': req.password
    };
    ExchangeCaptchaRequiredRequest.appendSerializeWithSetting(retMap, req, sharedSettings);
    return retMap;
  }
  
  static ResendVerificationEmailNotLoggedInRequest staticDeserializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    Map<String,dynamic> reqSerialized,
    FineSetting sharedSettings
  ) => ResendVerificationEmailNotLoggedInRequest(
    userUniqueId: reqSerialized['user_unique_id'] as String,
    password: reqSerialized['password'] as String,
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(reqSerialized['captcha_info'])
  );
  
  static Set<String>? validate<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    ResendVerificationEmailNotLoggedInRequest req,
    FineSetting sharedSettings
  ){
    Set<String>? retList = {};
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    return retList.isEmpty ? null : retList;
  }
}

final InteractiveSSOExchangeFormat<ResendVerificationEmailNotLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerificationEmail_NotLoggedIn_API = InteractiveSSOExchangeFormat(
  exchangeProtocolName: 'resendVerificationEmail_NotLoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verification_messages/verification_email'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: ResendVerificationEmailNotLoggedInRequest.staticDeserializeWithSettings, 
  serializeRequest: ResendVerificationEmailNotLoggedInRequest.staticSerializeWithSettings, 
  validateRequest: ResendVerificationEmailNotLoggedInRequest.validate,
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);