import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/searchresults.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_or_search_managing_apps.g.dart';

@JsonSerializable(includeIfNull: false)
class ListOrSearchManagingAppsRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(name: 'search_partial_display_name')
  String? searchPartialAPPDisplayName;
  
  ListOrSearchManagingAppsRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.searchPartialAPPDisplayName
  });
  factory ListOrSearchManagingAppsRequest.fromJson(Map<String,dynamic> json) => _$ListOrSearchManagingAppsRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ListOrSearchManagingAppsRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ListOrSearchManagingAppsRequest req) => req.toJson();
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static ListOrSearchManagingAppsRequest staticDeserialize(Map<String,dynamic> serialized) => ListOrSearchManagingAppsRequest.fromJson(serialized);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidate(ListOrSearchManagingAppsRequest req){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(req.searchPartialAPPDisplayName != null && req.searchPartialAPPDisplayName!.isEmpty){
      retList.add('search_partial_display_name');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<ListOrSearchManagingAppsRequest, ExchangeSearchAPPResult, void, Map<String,dynamic>, Map<String,dynamic>, void> listOrSearchManagingAppsAPI = ExchangeFormat(
  exchangeProtocolName: 'listOrSearchManagingAppsAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/apps'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 15
  ), 
  parseRequest: ListOrSearchManagingAppsRequest.staticDeserializeWithSettings, 
  serializeRequest: ListOrSearchManagingAppsRequest.staticSerializeWithSettings, 
  validateRequest: ListOrSearchManagingAppsRequest.staticValidateWithSettings, 
  parseSuccessResponseData: exchangeSearchAPPResultStaticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: exchangeSearchAPPResultStaticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);