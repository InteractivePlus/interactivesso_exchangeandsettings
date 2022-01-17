import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedoauthtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fetch_oauth_authorization.g.dart';

@JsonSerializable()
class FetchOAuthAuthorizationRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  FetchOAuthAuthorizationRequest({required this.userAccessToken, required this.userUniqueId, required this.appClientId});
  factory FetchOAuthAuthorizationRequest.fromJson(Map<String,dynamic> json) => _$FetchOAuthAuthorizationRequestFromJson(json);
  Map<String,dynamic> toJson() => _$FetchOAuthAuthorizationRequestToJson(this);
  static Map<String,dynamic> staticSerialize(FetchOAuthAuthorizationRequest req) => req.toJson();
  static FetchOAuthAuthorizationRequest staticDeserialize(Map<String,dynamic> serialized) => FetchOAuthAuthorizationRequest.fromJson(serialized);
  static Set<String>? staticValidate(FetchOAuthAuthorizationRequest req){
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

InteractiveSSOExchangeFormat<FetchOAuthAuthorizationRequest, ExchangedReturnedOAuthUserAuthorization, void, Map<String,dynamic>, Map<String,dynamic>, void> fetchOAuthAuthorizationAPI = ExchangeFormat(
  exchangeProtocolName: 'fetchOAuthAuthorizationAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_authorization'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(), 
  parseRequest: FetchOAuthAuthorizationRequest.staticDeserializeWithSettings, 
  serializeRequest: FetchOAuthAuthorizationRequest.staticSerializeWithSettings,
  validateRequest: FetchOAuthAuthorizationRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedOAuthUserAuthorization.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedOAuthUserAuthorization.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);