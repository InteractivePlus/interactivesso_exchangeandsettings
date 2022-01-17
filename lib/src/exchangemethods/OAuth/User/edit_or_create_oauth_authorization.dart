import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_or_create_oauth_authorization.g.dart';

@JsonSerializable()
class EditOrCreateOAuthAuthorizationRequest implements ExchangeUserTokenRequiredRequest{
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

  EditOrCreateOAuthAuthorizationRequest({required this.userAccessToken, required this.userUniqueId, required this.appClientId, required this.tokenSetting});
  factory EditOrCreateOAuthAuthorizationRequest.fromJson(Map<String,dynamic> json) => _$EditOrCreateOAuthAuthorizationRequestFromJson(json);
  Map<String,dynamic> toJson() => _$EditOrCreateOAuthAuthorizationRequestToJson(this);
  static Map<String,dynamic> staticSerialize(EditOrCreateOAuthAuthorizationRequest req) => req.toJson();
  static EditOrCreateOAuthAuthorizationRequest staticDeserialize(Map<String,dynamic> serialized) => EditOrCreateOAuthAuthorizationRequest.fromJson(serialized);
  static Set<String>? staticValidate(EditOrCreateOAuthAuthorizationRequest req){
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

InteractiveSSOExchangeFormat<EditOrCreateOAuthAuthorizationRequest, void, void, Map<String,dynamic>, void, void> editOrCreateOAuthAuthorizationAPI = ExchangeFormat(
  exchangeProtocolName: 'editOrCreateOAuthAuthorizationAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PUT, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/oauth_scopes'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(), 
  parseRequest: EditOrCreateOAuthAuthorizationRequest.staticDeserializeWithSettings, 
  serializeRequest: EditOrCreateOAuthAuthorizationRequest.staticSerializeWithSettings,
  validateRequest: EditOrCreateOAuthAuthorizationRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);