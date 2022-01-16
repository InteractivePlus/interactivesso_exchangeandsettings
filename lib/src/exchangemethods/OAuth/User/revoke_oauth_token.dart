import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'revoke_oauth_token.g.dart';

@JsonSerializable()
class RevokeOAuthTokenRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  RevokeOAuthTokenRequest({required this.userAccessToken, required this.userUniqueId, required this.appClientId});
  factory RevokeOAuthTokenRequest.fromJson(Map<String,dynamic> json) => _$RevokeOAuthTokenRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RevokeOAuthTokenRequestToJson(this);
  static Map<String,dynamic> staticSerialize(RevokeOAuthTokenRequest req) => req.toJson();
  static RevokeOAuthTokenRequest staticDeserialize(Map<String,dynamic> serialized) => RevokeOAuthTokenRequest.fromJson(serialized);
  static Set<String>? staticValidate(RevokeOAuthTokenRequest req){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<RevokeOAuthTokenRequest, void, void, Map<String,dynamic>, void, void> revokeOAuthTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'revokeOAuthTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.DELETE, 
    successfulHTTPCode: 204, 
    possibleHTTPCodes: [204, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_tokens'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(), 
  parseRequest: RevokeOAuthTokenRequest.staticDeserializeWithSettings, 
  serializeRequest: RevokeOAuthTokenRequest.staticSerializeWithSettings,
  validateRequest: RevokeOAuthTokenRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);