import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'returnedoauthtoken.g.dart';

@JsonSerializable()
class ExchangedReturnedOAuthToken implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'access_token')
  String accessToken;

  @JsonKey(required: true, name: 'refresh_token')
  String refreshToken;

  @JsonKey(required: true, name: 'access_token_expires')
  ExpirableInfo accessTokenExpires;

  @JsonKey(required: true, name: 'refresh_token_expires')
  ExpirableInfo refreshTokenExpires;

  @JsonKey(required: true, name: 'valid')
  bool valid;

  @JsonKey(required:true, name: 'exchange_method', toJson: Serializable.convertToDynamicSerialized, fromJson: ExchangeMethod.fromJson)
  ExchangeMethod exchangeMethod;

  @JsonKey(required: true, name: 'oauth_perm')
  OAuthPermissionInfo tokenPermission;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(name: 'custom_role')
  int? customRole;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangedReturnedOAuthTokenToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  ExchangedReturnedOAuthToken({
    required this.userUniqueId,
    required this.appClientId,  
    required this.accessToken,
    required this.accessTokenExpires,
    required this.refreshToken,
    required this.refreshTokenExpires,
    required this.valid,
    required this.exchangeMethod,
    required this.tokenPermission,
    this.customRole
  });
  factory ExchangedReturnedOAuthToken.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedOAuthTokenFromJson(map);
  static ExchangedReturnedOAuthToken fromJson(Map<String,dynamic> json) => ExchangedReturnedOAuthToken.fromMap(json);
  static ExchangedReturnedOAuthToken? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}

@JsonSerializable()
class ExchangeOAuthTokenRequiredRequest{
  @JsonKey(required: true, name: 'oauth_access_token')
  String oAuthAccessToken;
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;
  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  ExchangeOAuthTokenRequiredRequest({required this.oAuthAccessToken, required this.userUniqueId, required this.appClientId});

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangeOAuthTokenRequiredRequest request,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeOAuthTokenRequiredRequestToJson(request);

  static ExchangeOAuthTokenRequiredRequest fromJson<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeOAuthTokenRequiredRequestFromJson(map);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeOAuthTokenRequiredRequest request){
    appendTo['oauth_access_token'] = request.oAuthAccessToken;
    appendTo['user_unique_id'] = request.userUniqueId;
    appendTo['client_id'] = request.appClientId;
  }
}

@JsonSerializable()
class ExchangeOAuthRefreshTokenRequiredRequest{
  @JsonKey(required: true, name: 'oauth_refresh_token')
  String oAuthRefreshToken;
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;
  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  ExchangeOAuthRefreshTokenRequiredRequest({required this.oAuthRefreshToken, required this.userUniqueId, required this.appClientId});

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangeOAuthRefreshTokenRequiredRequest request,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeOAuthRefreshTokenRequiredRequestToJson(request);

  static ExchangeOAuthRefreshTokenRequiredRequest fromJson<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeOAuthRefreshTokenRequiredRequestFromJson(map);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeOAuthRefreshTokenRequiredRequest request){
    appendTo['oauth_refresh_token'] = request.oAuthRefreshToken;
    appendTo['user_unique_id'] = request.userUniqueId;
    appendTo['client_id'] = request.appClientId;
  }
}