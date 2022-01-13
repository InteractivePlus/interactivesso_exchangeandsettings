import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';

class ResendVerifyPhoneNotLoggedInRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements ExchangeCaptchaRequiredRequest<CaptchaSerialized, CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;

  String userUniqueId;

  String password;

  CommunicationMethod? preferredCommunicationMethod;

  bool forcePreferredMethod;

  ResendVerifyPhoneNotLoggedInRequest({
    required this.userUniqueId,
    required this.password,
    required this.captchaInfo,
    this.forcePreferredMethod = false,
    this.preferredCommunicationMethod
  });

  static Map<String,dynamic> staticSerializeWithSettings<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerifyPhoneNotLoggedInRequest<CaptchaSerializedInfo,CaptchaInfo> req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    Map<String,dynamic> retMap = {
      'user_unique_id': req.userUniqueId,
      'password': req.password,
      'force_preferred_method': req.forcePreferredMethod,
    };
    if(req.preferredCommunicationMethod != null){
      retMap['preferred_method'] = Serializable.convertToSerialized(req.preferredCommunicationMethod!);
    }
    ExchangeCaptchaRequiredRequest.appendSerialize(retMap, req, sharedSettings.captchaInfoSerializer);
    return retMap;
  }

  static Map<String,dynamic> staticSerializeWithSettingsGeneral<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerifyPhoneNotLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    if(req is ResendVerifyPhoneNotLoggedInRequest<CaptchaSerializedInfo,CaptchaInfo>){
      return staticSerializeWithSettings(req, sharedSettings);
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }

  static ResendVerifyPhoneNotLoggedInRequest staticDeserializeWithSettings<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> reqSerialized,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => ResendVerifyPhoneNotLoggedInRequest(
    userUniqueId: reqSerialized['user_unique_id'] as String, 
    password: reqSerialized['password'] as String, 
    captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(reqSerialized['captcha_info']),
    forcePreferredMethod: reqSerialized['force_preferred_method'] as bool,
    preferredCommunicationMethod: reqSerialized['preferred_method'] == null ? null : CommunicationMethod.fromJson(reqSerialized['preferred_method'] as String)
  );

  static List<String>? validate<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerifyPhoneNotLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    List<String> retList = List.empty(growable: true);
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    if(req.preferredCommunicationMethod != null && req.preferredCommunicationMethod!.verifyTarget != PhoneOrEmail.phone){
      retList.add('preferred_method');
    }
    return retList.isEmpty ? null : retList;
  }
}

final ExchangeFormat<ResendVerifyPhoneNotLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerifyPhone_NotLoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'resendVerifyPhone_NotLoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verify_phone_message'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: ResendVerifyPhoneNotLoggedInRequest.staticDeserializeWithSettings,
  serializeRequest: ResendVerifyPhoneNotLoggedInRequest.staticSerializeWithSettingsGeneral,
  validateRequest: ResendVerifyPhoneNotLoggedInRequest.validate,
  parseSuccessResponseData: exchangeVoidToVoidFunction, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: exchangeVoidToVoidFunction, 
  serializeFailedResponseData: exchangeVoidToVoidFunction, 
  requireVerificationCode: false
);