import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../CommonTypes/returnedappinfo.dart';
import '../CommonTypes/returnedtoken.dart';
import '../../interface/exchangeformat.dart';

part 'read_application_info.g.dart';

@JsonSerializable()
class ReadApplicationInfoRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  ReadApplicationInfoRequest({
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId
  });
  factory ReadApplicationInfoRequest.fromJson(Map<String,dynamic> json) => _$ReadApplicationInfoRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ReadApplicationInfoRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ReadApplicationInfoRequest req) => req.toJson();
  static ReadApplicationInfoRequest staticDeserialize(Map<String,dynamic> serialized) => ReadApplicationInfoRequest.fromJson(serialized);
  static Set<String>? staticValidate(ReadApplicationInfoRequest req){
    Set<String> retList = {};
    var tokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(tokenRst != null){
      retList.addAll(tokenRst);
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

InteractiveSSOExchangeFormat<ReadApplicationInfoRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> readApplicationInfoAPI = ExchangeFormat(
  exchangeProtocolName: 'readApplicationInfoAPI', 
  httpMetaData: ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 404, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 6
  ), 
  parseRequest: ReadApplicationInfoRequest.staticDeserializeWithSettings, 
  serializeRequest: ReadApplicationInfoRequest.staticSerializeWithSettings, 
  validateRequest: ReadApplicationInfoRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);