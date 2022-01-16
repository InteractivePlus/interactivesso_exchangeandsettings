import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/searchentitylimitedrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'list_or_search_authorized_oauth_tokens.g.dart';

@JsonSerializable(includeIfNull: false)
class ListOrSearchAuthorizedOAuthTokens implements ExchangeUserTokenRequiredRequest, ExchangeSearchEntityLimitedRequest {
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

  ListOrSearchAuthorizedOAuthTokens({
    required this.userAccessToken,
    required this.userUniqueId,
    this.searchAppDisplayNamePartial,
    this.searchOffset = 0,
    this.searchLimit
  });
  factory ListOrSearchAuthorizedOAuthTokens.fromJson(Map<String,dynamic> json) => _$ListOrSearchAuthorizedOAuthTokensFromJson(json);
  Map<String,dynamic> toJson() => _$ListOrSearchAuthorizedOAuthTokensToJson(this);
  static Map<String,dynamic> staticSerialize(ListOrSearchAuthorizedOAuthTokens req) => req.toJson();
  static ListOrSearchAuthorizedOAuthTokens staticDeserialize(Map<String,dynamic> json) => ListOrSearchAuthorizedOAuthTokens.fromJson(json);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ListOrSearchAuthorizedOAuthTokens req,
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