import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/searchentitylimitedrequest.dart';
import '../../CommonTypes/searchresults.dart';
import '../../../interface/exchangeformat.dart';

part 'list_or_search_oauth_authorization.g.dart';

@JsonSerializable(includeIfNull: false)
class ListOrSearchOAuthAuthorizationRequest implements ExchangeUserTokenRequiredRequest, ExchangeSearchEntityLimitedRequest {
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

  ListOrSearchOAuthAuthorizationRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.searchAppDisplayNamePartial,
    this.searchOffset = 0,
    this.searchLimit
  });
  factory ListOrSearchOAuthAuthorizationRequest.fromJson(Map<String,dynamic> json) => _$ListOrSearchOAuthAuthorizationRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ListOrSearchOAuthAuthorizationRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ListOrSearchOAuthAuthorizationRequest req) => req.toJson();
  static ListOrSearchOAuthAuthorizationRequest staticDeserialize(Map<String,dynamic> json) => ListOrSearchOAuthAuthorizationRequest.fromJson(json);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ListOrSearchOAuthAuthorizationRequest req,
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

InteractiveSSOExchangeFormat<ListOrSearchOAuthAuthorizationRequest, ExchangeSearchAuthorizationRecordsResult, void, Map<String,dynamic>, Map<String,dynamic>, void> listOrSearchOAuthAuthorizationAPI = ExchangeFormat(
  exchangeProtocolName: 'listOrSearchOAuthAuthorizationAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/authorized_apps'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 10
  ), 
  parseRequest: ListOrSearchOAuthAuthorizationRequest.staticDeserializeWithSettings, 
  serializeRequest: ListOrSearchOAuthAuthorizationRequest.staticSerializeWithSettings,
  validateRequest: ListOrSearchOAuthAuthorizationRequest.staticValidateWithSettings, 
  parseSuccessResponseData: exchangeSearchAuthorizationRecordsResultStaticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: exchangeSearchAuthorizationRecordsResultStaticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);