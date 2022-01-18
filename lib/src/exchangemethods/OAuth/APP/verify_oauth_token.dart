
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedoauthtoken.dart';
import '../../../interface/exchangeformat.dart';

part 'verify_oauth_token.g.dart';

@JsonSerializable(includeIfNull: false)
class VerifyOAuthTokenRequest implements ExchangeOAuthTokenRequiredRequest{
  @JsonKey(required: true, name: 'client_id')
  @override
  String appClientId;

  @JsonKey(required:  true, name: 'oauth_access_token')
  @override
  String oAuthAccessToken;

  @JsonKey(required: true, name:' user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(name: 'client_secret')
  String? appClientSecret;

  VerifyOAuthTokenRequest({
    required this.appClientId,
    required this.oAuthAccessToken,
    required this.userUniqueId,
    this.appClientSecret
  });
  factory VerifyOAuthTokenRequest.fromJson(Map<String,dynamic> json) => _$VerifyOAuthTokenRequestFromJson(json);
  Map<String,dynamic> toJson() => _$VerifyOAuthTokenRequestToJson(this);
  static Map<String,dynamic> staticSerialize(VerifyOAuthTokenRequest req) => req.toJson();
  static VerifyOAuthTokenRequest staticDeserialize(Map<String,dynamic> serialized) => VerifyOAuthTokenRequest.fromJson(serialized);
  static Set<String>? staticValidate(VerifyOAuthTokenRequest req){
    //Set<String> retList = {};
    var oauthTokenRst = ExchangeOAuthTokenRequiredRequest.staticValidate(req);
    /* if(oauthTokenRst != null){
      retList.addAll(oauthTokenRst);
    } */
    return oauthTokenRst;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<VerifyOAuthTokenRequest, UserOAuthAuthorization, void, Map<String,dynamic>, Map<String,dynamic>, void> verifyOAuthTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'verifyOAuthTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_token/validate_result'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(

    ), 
    parseRequest: VerifyOAuthTokenRequest.staticDeserializeWithSettings, 
    serializeRequest: VerifyOAuthTokenRequest.staticSerializeWithSettings, 
    validateRequest: VerifyOAuthTokenRequest.staticValidateWithSettings, 
    parseSuccessResponseData: ssoConvertToExchangeFormatFunc(UserOAuthAuthorization.fromJson), 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ssoConvertToExchangeFormatFunc((UserOAuthAuthorization auth) => auth.toJson()), 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: false
  );