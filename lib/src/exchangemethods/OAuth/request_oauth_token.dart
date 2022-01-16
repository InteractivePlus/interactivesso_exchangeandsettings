import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedoauthtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_oauth_token.g.dart';

@JsonSerializable()
class RequestOAuthTokenRequest{
  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'client_secret')
  String? appClientSecret;

  @JsonKey(name: 'verifier')
  String? challengeVerifier;

  @JsonKey(required: true, name: 'auth_code')
  String authCodeId;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  RequestOAuthTokenRequest({
    required this.authCodeId,
    required this.userUniqueId,
    required this.appClientId,
    this.appClientSecret,
    this.challengeVerifier
  });
  factory RequestOAuthTokenRequest.fromJson(Map<String,dynamic> json) => _$RequestOAuthTokenRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RequestOAuthTokenRequestToJson(this);
  static Map<String,dynamic> staticSerialize(RequestOAuthTokenRequest req) => req.toJson();
  static RequestOAuthTokenRequest staticDeserialize(Map<String,dynamic> json) => RequestOAuthTokenRequest.fromJson(json);
  static Set<String>? staticValidate(RequestOAuthTokenRequest req){
    Set<String> retList = {};
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    if(req.authCodeId.isEmpty){
      retList.add('auth_code');
    }
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<RequestOAuthTokenRequest, ExchangedReturnedOAuthToken, void, Map<String,dynamic>, Map<String,dynamic>, void> requestOAuthTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'requestOAuthTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/oauth_token'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 3
  ), 
  parseRequest: RequestOAuthTokenRequest.staticDeserializeWithSettings, 
  serializeRequest: RequestOAuthTokenRequest.staticSerializeWithSettings,
  validateRequest: RequestOAuthTokenRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedOAuthToken.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedOAuthToken.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);