import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/searchentitylimitedrequest.dart';
import '../../CommonTypes/searchresults.dart';
import '../../../interface/exchangeformat.dart';

part 'list_or_search_authorized_records.g.dart';

@JsonSerializable(includeIfNull: false)
class ListOrSearchAuthorizedRecordsRequest implements ExchangeUserTokenRequiredRequest, ExchangeSearchEntityLimitedRequest {
  @JsonKey(required:  true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(name: 'display_name')
  String? searchAppDisplayNamePartial;

  @JsonKey(name: 'search_limit')
  @override
  int? searchLimit;

  @JsonKey(name: 'search_offset')
  @override
  int searchOffset;

  ListOrSearchAuthorizedRecordsRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.searchAppDisplayNamePartial,
    this.searchOffset = 0,
    this.searchLimit
  });
  factory ListOrSearchAuthorizedRecordsRequest.fromJson(Map<String,dynamic> json) => _$ListOrSearchAuthorizedRecordsRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ListOrSearchAuthorizedRecordsRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ListOrSearchAuthorizedRecordsRequest req) => req.toJson();
  static ListOrSearchAuthorizedRecordsRequest staticDeserialize(Map<String,dynamic> json) => ListOrSearchAuthorizedRecordsRequest.fromJson(json);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ListOrSearchAuthorizedRecordsRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    var searchLimitedRst = ExchangeSearchEntityLimitedRequest.validateWithSettings(req,sharedSettings);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(searchLimitedRst != null){
      retList.addAll(searchLimitedRst);
    }
    return retList.isEmpty ? null : retList;
  }
}

InteractiveSSOExchangeFormat<ListOrSearchAuthorizedRecordsRequest, ExchangeSearchAuthorizationRecordsResult, void, Map<String,dynamic>, Map<String,dynamic>, void> listOrSearchAuthorizedRecords = ExchangeFormat(
  exchangeProtocolName: 'listOrSearchAuthorizedRecords', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/authorized_apps'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 10
  ), 
  parseRequest: ListOrSearchAuthorizedRecordsRequest.staticDeserializeWithSettings, 
  serializeRequest: ListOrSearchAuthorizedRecordsRequest.staticSerializeWithSettings,
  validateRequest: ListOrSearchAuthorizedRecordsRequest.staticValidateWithSettings, 
  parseSuccessResponseData: exchangeSearchAuthorizationRecordsResultStaticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: exchangeSearchAuthorizationRecordsResultStaticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);