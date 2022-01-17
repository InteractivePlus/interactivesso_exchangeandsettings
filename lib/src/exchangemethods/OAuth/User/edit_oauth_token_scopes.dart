import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_oauth_token_scopes.g.dart';

@JsonSerializable()
class EditOAuthTokenScopesRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'oauth_setting')
  OAuthPermissionInfo tokenSetting;

  EditOAuthTokenScopesRequest({required this.userAccessToken, required this.userUniqueId, required this.appClientId, required this.tokenSetting});
  factory EditOAuthTokenScopesRequest.fromJson(Map<String,dynamic> json) => _$EditOAuthTokenScopesRequestFromJson(json);
  Map<String,dynamic> toJson() => _$EditOAuthTokenScopesRequestToJson(this);
  static Map<String,dynamic> staticSerialize(EditOAuthTokenScopesRequest req) => req.toJson();
  static EditOAuthTokenScopesRequest staticDeserialize(Map<String,dynamic> serialized) => EditOAuthTokenScopesRequest.fromJson(serialized);
  static Set<String>? staticValidate(EditOAuthTokenScopesRequest req){
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

InteractiveSSOExchangeFormat<EditOAuthTokenScopesRequest, void, void, Map<String,dynamic>, void, void> editOAuthTokenScopesAPI = ExchangeFormat(
  exchangeProtocolName: 'editOAuthTokenScopesAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_scopes'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(), 
  parseRequest: EditOAuthTokenScopesRequest.staticDeserializeWithSettings, 
  serializeRequest: EditOAuthTokenScopesRequest.staticSerializeWithSettings,
  validateRequest: EditOAuthTokenScopesRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);