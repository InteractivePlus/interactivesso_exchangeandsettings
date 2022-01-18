import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/sendvericoderequest.dart';

import '../../CommonTypes/captcharequiredrequest.dart';
import '../../../interface/exchangeformat.dart';

class ResendVerifyPhoneNotLoggedInRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements ExchangeSendVericodeWithPreferredMethodRequest, ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;

  String userUniqueId;

  String password;

  @override
  CommunicationMethod? preferredMethod;

  @override
  bool forcePreferredMethod;

  ResendVerifyPhoneNotLoggedInRequest({
    required this.userUniqueId,
    required this.password,
    required this.captchaInfo,
    this.forcePreferredMethod = false,
    this.preferredMethod
  });

  static Map<String,dynamic> staticSerializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    ResendVerifyPhoneNotLoggedInRequest req,
    FineSetting sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'user_unique_id': req.userUniqueId,
      'password': req.password,
      'force_preferred_method': req.forcePreferredMethod,
    };
    if(req.preferredMethod != null){
      retMap['preferred_method'] = Serializable.convertToSerialized(req.preferredMethod!);
    }
    ExchangeCaptchaRequiredRequest.appendSerializeWithSetting(retMap, req, sharedSettings);
    return retMap;
  }

  static ResendVerifyPhoneNotLoggedInRequest staticDeserializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    Map<String,dynamic> reqSerialized,
    FineSetting sharedSettings
  ) => ResendVerifyPhoneNotLoggedInRequest(
    userUniqueId: reqSerialized['user_unique_id'] as String, 
    password: reqSerialized['password'] as String, 
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(reqSerialized['captcha_info']),
    forcePreferredMethod: reqSerialized['force_preferred_method'] as bool,
    preferredMethod: reqSerialized['preferred_method'] == null ? null : CommunicationMethod.fromJson(reqSerialized['preferred_method'] as String)
  );

  static Set<String>? validate<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    ResendVerifyPhoneNotLoggedInRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    if(req.preferredMethod != null && req.preferredMethod!.verifyTarget != PhoneOrEmail.phone){
      retList.add('preferred_method');
    }
    return retList.isEmpty ? null : retList;
  }
}

final InteractiveSSOExchangeFormat<ResendVerifyPhoneNotLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerifyPhone_NotLoggedIn_API = InteractiveSSOExchangeFormat(
  exchangeProtocolName: 'resendVerifyPhone_NotLoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verification_messages/verify_phone_message'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: ResendVerifyPhoneNotLoggedInRequest.staticDeserializeWithSettings,
  serializeRequest: ResendVerifyPhoneNotLoggedInRequest.staticSerializeWithSettings,
  validateRequest: ResendVerifyPhoneNotLoggedInRequest.validate,
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);