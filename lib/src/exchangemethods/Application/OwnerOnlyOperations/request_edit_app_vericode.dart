import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedtoken.dart';
import '../../../interface/exchangeformat.dart';

part 'request_edit_app_vericode.g.dart';

@JsonSerializable()
class RequestEditAPPVericodeRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(required: true, name: 'client_id')
  String appClientIdToManage;

  RequestEditAPPVericodeRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    required this.appClientIdToManage
  });
  factory RequestEditAPPVericodeRequest.fromJson(Map<String,dynamic> json) => _$RequestEditAPPVericodeRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RequestEditAPPVericodeRequestToJson(this);
  static RequestEditAPPVericodeRequest staticDeserialize(Map<String,dynamic> serialized) => RequestEditAPPVericodeRequest.fromJson(serialized);
  static Map<String,dynamic> staticSerialize(RequestEditAPPVericodeRequest req) => req.toJson();
  static Set<String>? staticValidate(RequestEditAPPVericodeRequest req){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(req.appClientIdToManage.isEmpty){
      retList.add('client_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<RequestEditAPPVericodeRequest, void, void, Map<String,dynamic>, void, void> requestManageAppVericodeAPI = ExchangeFormat(
  exchangeProtocolName: 'requestManageAppVericodeAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/verification_messages/manage_app'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 5
  ), 
  parseRequest: RequestEditAPPVericodeRequest.staticDeserializeWithSettings, 
  serializeRequest: RequestEditAPPVericodeRequest.staticSerializeWithSettings, 
  validateRequest: RequestEditAPPVericodeRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);