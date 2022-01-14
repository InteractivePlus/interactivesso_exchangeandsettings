import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/captcharequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returneduserentity.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';


class ChangeOrAddContactApplyNotLoggedRequest<CaptchaSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerialized>> implements ExchangeCaptchaRequiredRequest<CaptchaSerialized,CaptchaInfo>{
  @override
  CaptchaInfo captchaInfo;

  String userUniqueId;

  String password;

  bool changePhone;

  String? newEmail;

  PhoneNumber? newPhoneNum;

  CommunicationMethod? preferredMethod;

  bool forcePreferredMethod;

  ChangeOrAddContactApplyNotLoggedRequest({
    required this.captchaInfo,
    required this.userUniqueId,
    required this.password,
    required this.changePhone,
    this.newEmail,
    this.newPhoneNum,
    this.forcePreferredMethod = false,
    this.preferredMethod
  });
  static Map<String,dynamic> staticSerializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ChangeOrAddContactApplyNotLoggedRequest req,
    FineSetting sharedSetting
  ){
    Map<String,dynamic> retMap = {
      'captcha_info': sharedSetting.captchaInfoSerializer.serialize(req.captchaInfo),
      'user_unique_id': req.userUniqueId,
      'password': req.password,
      'change_phone': req.changePhone,
      'force_preferred_method': req.forcePreferredMethod
    };
    if(req.newEmail != null && !req.changePhone){
      retMap['new_email'] = req.newEmail;
    }
    if(req.newPhoneNum != null && req.changePhone){
      retMap['new_phone'] = NullablePhoneNumberConverter().toJson(req.newPhoneNum);
    }
    if(req.preferredMethod != null){
      retMap['preferred_method'] = req.preferredMethod!.toJson();
    }
    return retMap;
  }
  static ChangeOrAddContactApplyNotLoggedRequest staticDeserializeWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> serialized,
    FineSetting sharedSetting
  ) => ChangeOrAddContactApplyNotLoggedRequest(
    captchaInfo: sharedSetting.captchaInfoSerializer.fromDynamicSerialized(serialized['captcha_info']), 
    userUniqueId: serialized['user_unique_id'] as String, 
    password: serialized['password'] as String, 
    changePhone: serialized['change_phone'] as bool,
    newEmail: serialized['new_email'] as String?,
    newPhoneNum: NullablePhoneNumberConverter().fromJson(serialized['new_phone'] as String?),
    forcePreferredMethod: serialized['force_preferred_method'] as bool,
    preferredMethod: serialized['preferred_method'] == null ? null : CommunicationMethod.fromString(serialized['preferred_method'] as String)
  );
  static List<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ChangeOrAddContactApplyNotLoggedRequest req,
    FineSetting sharedSetting
  ){
    List<String> retList = List.empty(growable: true);
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(!sharedSetting.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.password)){
      retList.add('password');
    }
    if(req.preferredMethod != null &&
      (
        (req.changePhone && req.preferredMethod!.verifyTarget != PhoneOrEmail.phone)
        || (!req.changePhone && req.preferredMethod!.verifyTarget != PhoneOrEmail.email)
      )
    ){
      retList.add('preferred_method');
    }
    if(req.changePhone && req.newPhoneNum != null && !req.newPhoneNum!.validate()){
      retList.add('new_phone');
    }
    if(!req.changePhone && req.newEmail != null && !sharedSetting.validatorSettings.userSystemValidators.emailValidator.validate(req.newEmail!)){
      retList.add('new_mail');
    }
    return retList.isEmpty ? null : retList;
  }
}

InteractiveSSOExchangeFormat<ChangeOrAddContactApplyNotLoggedRequest, ExchangedUserEntity, void, Map<String,dynamic>, Map<String,dynamic>, void> changeOrAddContactApply_NotLogged_API = ExchangeFormat(
  exchangeProtocolName: 'changeOrAddContactApply_NotLogged_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/{user_unique_id}/contact_method_notloggedin'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 2
  ), 
  parseRequest: ChangeOrAddContactApplyNotLoggedRequest.staticDeserializeWithSettings, 
  serializeRequest: ChangeOrAddContactApplyNotLoggedRequest.staticSerializeWithSettings, 
  validateRequest: ChangeOrAddContactApplyNotLoggedRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedUserEntity.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedUserEntity.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);