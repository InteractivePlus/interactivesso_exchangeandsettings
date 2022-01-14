import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
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

  static Map<String,dynamic> staticSerialize
  (
    ResendVerifyPhoneLoggedInRequest req
  ) => req.toJson();

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);

  static ResendVerifyPhoneLoggedInRequest staticDeserialize
  (
    Map<String,dynamic> reqSerialized,
  ) => ResendVerifyPhoneLoggedInRequest.fromMap(reqSerialized);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);

  static List<String>? validate<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    ResendVerifyPhoneLoggedInRequest req,
    FineSetting sharedSettings
  ){
    if(req.preferredCommunicationMethod != null && req.preferredCommunicationMethod!.verifyTarget != PhoneOrEmail.phone){
      return ['preferred_method'];
    }else{
      return null;
    }
  }
}

InteractiveSSOExchangeFormat<ResendVerifyPhoneLoggedInRequest, void, void, Map<String,dynamic>, void, void> resendVerifyPhone_LoggedIn_API = InteractiveSSOExchangeFormat(
  exchangeProtocolName: 'resendVerifyPhone_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/verification_messages/loggedin_verify_phone_message'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ResendVerifyPhoneLoggedInRequest.staticDeserializeWithSettings, 
  serializeRequest: ResendVerifyPhoneLoggedInRequest.staticSerializeWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);