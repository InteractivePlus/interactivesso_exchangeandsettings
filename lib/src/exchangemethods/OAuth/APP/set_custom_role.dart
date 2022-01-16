
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'set_custom_role.g.dart';

@JsonSerializable(includeIfNull: false)
class SetCustomRoleRequest{
  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name:' user_unique_id')
  String userUniqueId;
  
  @JsonKey(required:true, name: 'client_secret')
  String appClientSecret;

  SetCustomRoleRequest({
    required this.appClientId,
    required this.userUniqueId,
    required this.appClientSecret
  });
  factory SetCustomRoleRequest.fromJson(Map<String,dynamic> json) => _$SetCustomRoleRequestFromJson(json);
  Map<String,dynamic> toJson() => _$SetCustomRoleRequestToJson(this);
  static Map<String,dynamic> staticSerialize(SetCustomRoleRequest req) => req.toJson();
  static SetCustomRoleRequest staticDeserialize(Map<String,dynamic> serialized) => SetCustomRoleRequest.fromJson(serialized);
  static Set<String>? staticValidate(SetCustomRoleRequest req){
    Set<String> retList = {};
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(req.appClientSecret.isEmpty){
      retList.add('client_secret');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<SetCustomRoleRequest, void, void, Map<String,dynamic>, void, void> setCustomRoleAPI = ExchangeFormat(
  exchangeProtocolName: 'setCustomRoleAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/user/<user_unique_id>/custom_role'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(

    ), 
    parseRequest: SetCustomRoleRequest.staticDeserializeWithSettings, 
    serializeRequest: SetCustomRoleRequest.staticSerializeWithSettings, 
    validateRequest: SetCustomRoleRequest.staticValidateWithSettings, 
    parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: false
  );