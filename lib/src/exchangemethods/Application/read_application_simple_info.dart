import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedappinfo.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'read_application_simple_info.g.dart';

@JsonSerializable()
class ReadApplicationSimpleInfoRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  ReadApplicationSimpleInfoRequest({
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId
  });
  factory ReadApplicationSimpleInfoRequest.fromJson(Map<String,dynamic> json) => _$ReadApplicationSimpleInfoRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ReadApplicationSimpleInfoRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ReadApplicationSimpleInfoRequest req) => req.toJson();
  static ReadApplicationSimpleInfoRequest staticDeserialize(Map<String,dynamic> serialized) => ReadApplicationSimpleInfoRequest.fromJson(serialized);
  static Set<String>? staticValidate(ReadApplicationSimpleInfoRequest req){
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

InteractiveSSOExchangeFormat<ReadApplicationSimpleInfoRequest, ExchangedReturnedAppSimpleInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> readApplicationSimpleInfoAPI = ExchangeFormat(
  exchangeProtocolName: 'readApplicationSimpleInfoAPI', 
  httpMetaData: ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 404, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'apps/<client_id>/simple_info'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 6
  ), 
  parseRequest: ReadApplicationSimpleInfoRequest.staticDeserializeWithSettings, 
  serializeRequest: ReadApplicationSimpleInfoRequest.staticSerializeWithSettings, 
  validateRequest: ReadApplicationSimpleInfoRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedAppSimpleInfo.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedAppSimpleInfo.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);