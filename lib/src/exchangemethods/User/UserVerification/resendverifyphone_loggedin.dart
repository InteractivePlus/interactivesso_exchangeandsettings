import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resendverifyphone_loggedin.g.dart';

@JsonSerializable(includeIfNull: false)
class ResendVerifyPhoneLoggedInRequest extends ExchangeUserTokenRequiredRequest implements Serializable<Map<String,dynamic>>{

  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? preferredCommunicationMethod;

  @JsonKey(name: 'force_preferred_method')
  bool forcePreferredMethod;

  ResendVerifyPhoneLoggedInRequest({
    required String userUniqueId,
    required String userAccessToken,
    this.forcePreferredMethod = false,
    this.preferredCommunicationMethod
  }) : super(userUniqueId: userUniqueId, userAccessToken: userAccessToken);

  factory ResendVerifyPhoneLoggedInRequest.fromMap(Map<String,dynamic> map) => _$ResendVerifyPhoneLoggedInRequestFromJson(map);
  static ResendVerifyPhoneLoggedInRequest fromJson(Map<String,dynamic> json) => ResendVerifyPhoneLoggedInRequest.fromMap(json);
  static ResendVerifyPhoneLoggedInRequest? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ResendVerifyPhoneLoggedInRequestToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerifyPhoneLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => req.toJson();
  static ResendVerifyPhoneLoggedInRequest staticDeserialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> reqSerialized,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => ResendVerifyPhoneLoggedInRequest.fromMap(reqSerialized);
  static List<String>? validate<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ResendVerifyPhoneLoggedInRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    if(req.preferredCommunicationMethod != null && req.preferredCommunicationMethod!.verifyTarget != PhoneOrEmail.phone){
      return ['preferred_method'];
    }else{
      return null;
    }
  }
}

ExchangeFormat<ResendVerifyPhoneLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerifyPhone_LoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'resendVerifyPhone_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/loggedin_verify_phone_message'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ResendVerifyPhoneLoggedInRequest.staticDeserialize, 
  serializeRequest: ResendVerifyPhoneLoggedInRequest.staticSerialize, 
  parseSuccessResponseData: exchangeVoidToVoidFunction, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: exchangeVoidToVoidFunction, 
  serializeFailedResponseData: exchangeVoidToVoidFunction, 
  requireVerificationCode: false
);