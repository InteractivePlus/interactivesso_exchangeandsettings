
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/searchentitylimitedrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/searchresults.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searchuser.g.dart';

@JsonSerializable(includeIfNull: false)
class SearchUserRequest implements ExchangeUserTokenRequiredRequest, ExchangeSearchEntityLimitedRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(name: 'search_user_display_name')
  String? searchUserDisplayNamePartial;

  @JsonKey(name: 'search_limit')
  @override
  int? searchLimit;

  @JsonKey(required: true, name: 'search_offset')
  @override
  int searchOffset;

  SearchUserRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.searchUserDisplayNamePartial,
    this.searchOffset = 0,
    this.searchLimit
  });
  factory SearchUserRequest.fromJson(Map<String,dynamic> json) => _$SearchUserRequestFromJson(json);
  Map<String,dynamic> toJson() => _$SearchUserRequestToJson(this);
  static Map<String,dynamic> staticSerialize(SearchUserRequest req) => req.toJson();
  static SearchUserRequest staticDeserialize(Map<String,dynamic> serialized) => SearchUserRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    SearchUserRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var userTokenValidateResult = ExchangeUserTokenRequiredRequest.validate(req);
    var searchLimitedValidateResult = ExchangeSearchEntityLimitedRequest.validateWithSettings(req, sharedSettings);

    if(userTokenValidateResult != null){
      retList.addAll(userTokenValidateResult);
    }
    if(searchLimitedValidateResult != null){
      retList.addAll(searchLimitedValidateResult);
    }
    return retList.isEmpty ? null : retList; 
  }
}

InteractiveSSOExchangeFormat<SearchUserRequest, ExchangeSearchSimpleUserResult, void, Map<String,dynamic>, Map<String,dynamic>, void> searchUserAPI = ExchangeFormat(
  exchangeProtocolName: 'searchUserAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/search_result'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 10
    ), 
    parseRequest: SearchUserRequest.staticDeserializeWithSettings, 
    serializeRequest: SearchUserRequest.staticSerializeWithSettings,
    validateRequest: SearchUserRequest.staticValidateWithSettings, 
    parseSuccessResponseData: exchangeSearchSimpleUserResultStaticDeserializeWithSettings, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: exchangeSearchSimpleUserResultStaticSerializeWithSettings, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: false
  );