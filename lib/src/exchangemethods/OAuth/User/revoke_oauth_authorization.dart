import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedtoken.dart';
import '../../../interface/exchangeformat.dart';

part 'revoke_oauth_authorization.g.dart';

@JsonSerializable()
class RevokeOAuthAuthorizationRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  RevokeOAuthAuthorizationRequest({required this.userAccessToken, required this.userUniqueId, required this.appClientId});
  factory RevokeOAuthAuthorizationRequest.fromJson(Map<String,dynamic> json) => _$RevokeOAuthAuthorizationRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RevokeOAuthAuthorizationRequestToJson(this);
  static Map<String,dynamic> staticSerialize(RevokeOAuthAuthorizationRequest req) => req.toJson();
  static RevokeOAuthAuthorizationRequest staticDeserialize(Map<String,dynamic> serialized) => RevokeOAuthAuthorizationRequest.fromJson(serialized);
  static Set<String>? staticValidate(RevokeOAuthAuthorizationRequest req){
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

InteractiveSSOExchangeFormat<RevokeOAuthAuthorizationRequest, void, void, Map<String,dynamic>, void, void> revokeOAuthAuthorizationAPI = ExchangeFormat(
  exchangeProtocolName: 'revokeOAuthAuthorizationAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.DELETE, 
    successfulHTTPCode: 204, 
    possibleHTTPCodes: [204, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_authorization'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(), 
  parseRequest: RevokeOAuthAuthorizationRequest.staticDeserializeWithSettings, 
  serializeRequest: RevokeOAuthAuthorizationRequest.staticSerializeWithSettings,
  validateRequest: RevokeOAuthAuthorizationRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);