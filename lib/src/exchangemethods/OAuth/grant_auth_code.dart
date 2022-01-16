import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedoauthtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'grant_auth_code.g.dart';

@JsonSerializable()
class GrantAuthCodeRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required:  true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required:  true, name: 'client_id')
  String appClientId;
  
  @JsonKey(required: true, name: 'oauth_setting')
  OAuthPermissionInfo oAuthSetting;

  @JsonKey(required: true, name: 'exchange_method', toJson: Serializable.convertToDynamicSerialized, fromJson: ExchangeMethod.fromJson)
  ExchangeMethod oAuthExchangeMethod;

  @JsonKey(required: true, name: 'oauth_challenge_type', toJson: Serializable.convertToDynamicSerialized, fromJson: AuthCodeChallengeTypes.fromJson)
  AuthCodeChallengeTypes oAuthChallengeType;

  @JsonKey(name: 'oauth_challenge')
  String? challenge;

  GrantAuthCodeRequest({
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId,
    required this.oAuthSetting,
    required this.oAuthChallengeType,
    required this.oAuthExchangeMethod,
    this.challenge
  });
  factory GrantAuthCodeRequest.fromJson(Map<String,dynamic> json) => _$GrantAuthCodeRequestFromJson(json);
  Map<String,dynamic> toJson() => _$GrantAuthCodeRequestToJson(this);
  static Map<String,dynamic> staticSerialize(GrantAuthCodeRequest req) => req.toJson();
  static GrantAuthCodeRequest staticDeserialize(Map<String,dynamic> serialized) => GrantAuthCodeRequest.fromJson(serialized);
  static Set<String>? staticValidate(GrantAuthCodeRequest req){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    if(!req.oAuthExchangeMethod.acceptableChallengeTypes.contains(req.oAuthChallengeType)){
      retList.add('oauth_challenge_type');
    }
    if(!req.oAuthChallengeType.isValidChallengeString(req.challenge)){
      retList.add('oauth_challenge');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<GrantAuthCodeRequest, ExchangedReturnedOAuthAuthCode, void, Map<String,dynamic>, Map<String,dynamic>, void> grantAuthCodeAPI = ExchangeFormat(
  exchangeProtocolName: 'grantAuthCodeAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/oauth_auth_code'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 3
  ), 
  parseRequest: GrantAuthCodeRequest.staticDeserializeWithSettings, 
  serializeRequest: GrantAuthCodeRequest.staticSerializeWithSettings, 
  validateRequest: GrantAuthCodeRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedOAuthAuthCode.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedOAuthAuthCode.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);