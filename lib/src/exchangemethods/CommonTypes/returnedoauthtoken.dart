import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'returnedoauthtoken.g.dart';

@JsonSerializable()
class ExchangedReturnedUserToken implements Serializable<Map<String,dynamic>>{
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

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangedReturnedUserTokenToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  ExchangedReturnedUserToken({
    required this.accessToken,
    required this.accessTokenExpires,
    required this.refreshToken,
    required this.refreshTokenExpires,
    required this.valid
  });
  factory ExchangedReturnedUserToken.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedUserTokenFromJson(map);
  static ExchangedReturnedUserToken fromJson(Map<String,dynamic> json) => ExchangedReturnedUserToken.fromMap(json);
  static ExchangedReturnedUserToken? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}

@JsonSerializable()
class ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  String userAccessToken;
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  ExchangeUserTokenRequiredRequest({required this.userAccessToken, required this.userUniqueId});

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangeUserTokenRequiredRequest request,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeUserTokenRequiredRequestToJson(request);

  static ExchangeUserTokenRequiredRequest fromJson<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeUserTokenRequiredRequestFromJson(map);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeUserTokenRequiredRequest request){
    appendTo['user_access_token'] = request.userAccessToken;
  }
}

@JsonSerializable()
class ExchangeUserRefreshTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_refresh_token')
  String userRefreshToken;
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  ExchangeUserRefreshTokenRequiredRequest({required this.userRefreshToken, required this.userUniqueId});

  static Map<String,dynamic> staticSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangeUserRefreshTokenRequiredRequest request,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeUserRefreshTokenRequiredRequestToJson(request);

  static ExchangeUserRefreshTokenRequiredRequest fromJson<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => _$ExchangeUserRefreshTokenRequiredRequestFromJson(map);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeUserRefreshTokenRequiredRequest request){
    appendTo['user_refresh_token'] = request.userRefreshToken;
  }
}