import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedoauthtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'renew_oauth_token.g.dart';

@JsonSerializable()
class RenewOAuthTokenRequest implements ExchangeOAuthRefreshTokenRequiredRequest{
  @JsonKey(required: true, name: 'client_id')
  @override
  String appClientId;

  @JsonKey(required: true, name: 'oauth_refresh_token')
  @override
  String oAuthRefreshToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(name: 'client_secret')
  String? appClientSecret;

  RenewOAuthTokenRequest({required this.appClientId, this.appClientSecret, required this.oAuthRefreshToken, required this.userUniqueId});
  factory RenewOAuthTokenRequest.fromJson(Map<String,dynamic> json) => _$RenewOAuthTokenRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RenewOAuthTokenRequestToJson(this);
  static Map<String,dynamic> staticSerialize(RenewOAuthTokenRequest req) => req.toJson();
  static RenewOAuthTokenRequest staticDeserialize(Map<String,dynamic> serialized) => RenewOAuthTokenRequest.fromJson(serialized);
  static Set<String>? staticValidate(RenewOAuthTokenRequest req){
    //Set<String> retList = {};
    var refreshTokenRst = ExchangeOAuthRefreshTokenRequiredRequest.staticValidate(req);
    /* if(refreshTokenRst != null){
      retList.addAll(refreshTokenRst);
    } */
    return refreshTokenRst;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<RenewOAuthTokenRequest, ExchangedReturnedOAuthToken, void, Map<String,dynamic>, Map<String,dynamic>, void> renewOAuthTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'renewOAuthTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/renewed_token'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 3
  ), 
  parseRequest: RenewOAuthTokenRequest.staticDeserializeWithSettings, 
  serializeRequest: RenewOAuthTokenRequest.staticSerializeWithSettings, 
  validateRequest: RenewOAuthTokenRequest.staticValidateWithSettings,
  parseSuccessResponseData: ExchangedReturnedOAuthToken.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedOAuthToken.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);