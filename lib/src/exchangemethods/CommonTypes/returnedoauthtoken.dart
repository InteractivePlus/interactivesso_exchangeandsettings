import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
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

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

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
    required this.exchangeMethod
  });
  factory ExchangedReturnedOAuthToken.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedOAuthTokenFromJson(map);
  static ExchangedReturnedOAuthToken fromJson(Map<String,dynamic> json) => ExchangedReturnedOAuthToken.fromMap(json);
  static ExchangedReturnedOAuthToken? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  static Map<String,dynamic> staticSerialize(ExchangedReturnedOAuthToken code) => code.toJson();
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(fromJson);
}

@JsonSerializable()
class ExchangedReturnedOAuthAuthCode implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'auth_code')
  String authCodeId;

  @JsonKey(required: true, name: 'challenge_type', fromJson: AuthCodeChallengeTypes.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AuthCodeChallengeTypes challengeType; 

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'time_info')
  ExpirableInfo expirableInfo;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(required: true, name: 'exchange_method', toJson: Serializable.convertToDynamicSerialized, fromJson: ExchangeMethod.fromJson)
  ExchangeMethod exchangeMethod;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ExchangedReturnedOAuthAuthCodeToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ExchangedReturnedOAuthAuthCode({
    required this.authCodeId, 
    required this.challengeType, 
    required this.appClientId, 
    required this.expirableInfo, 
    required this.userUniqueId, 
    required this.exchangeMethod
  });

  factory ExchangedReturnedOAuthAuthCode.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedOAuthAuthCodeFromJson(map);
  static ExchangedReturnedOAuthAuthCode fromJson(Map<String,dynamic> json) => ExchangedReturnedOAuthAuthCode.fromMap(json);
  static ExchangedReturnedOAuthAuthCode? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }
  static Map<String,dynamic> staticSerialize(ExchangedReturnedOAuthAuthCode code) => code.toJson();
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(fromJson);
}

@JsonSerializable()
class ExchangedReturnedOAuthUserAuthorization implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'oauth_setting')
  OAuthPermissionInfo authorizedOAuthSetting;

  @JsonKey(required: true, name: 'oauth_permission')
  OAuthPermissionInfo oAuthPermissionOverall;

  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @JsonKey(name: 'custom_role')
  int? customRole;

  ExchangedReturnedOAuthUserAuthorization({
    required this.authorizedOAuthSetting,
    required this.oAuthPermissionOverall,
    required this.appClientId,
    required this.userUniqueId
  });
  factory ExchangedReturnedOAuthUserAuthorization.fromMap(Map<String,dynamic> json) => _$ExchangedReturnedOAuthUserAuthorizationFromJson(json);
  static ExchangedReturnedOAuthUserAuthorization fromJson(Map<String,dynamic> json) => ExchangedReturnedOAuthUserAuthorization.fromMap(json);
  static ExchangedReturnedOAuthUserAuthorization? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  @override  
  Map<String,dynamic> toJson() => _$ExchangedReturnedOAuthUserAuthorizationToJson(this);
  @override
  Map<String, dynamic> serialize([String? locale]) => toJson();
  static Map<String,dynamic> staticSerialize(ExchangedReturnedOAuthUserAuthorization ins) => ins.toJson();
  static final staticDeserialize = fromJson;
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
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

  static Map<String,dynamic> staticSerialize
  (
    ExchangeOAuthTokenRequiredRequest request
  ) => _$ExchangeOAuthTokenRequiredRequestToJson(request);

  static ExchangeOAuthTokenRequiredRequest staticDeserialize
  (
    Map<String,dynamic> map
  ) => _$ExchangeOAuthTokenRequiredRequestFromJson(map);
  static Set<String>? staticValidate(ExchangeOAuthTokenRequiredRequest req) {
    Set<String> retList = {};
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    if(req.oAuthAccessToken.isEmpty){
      retList.add('oauth_access_token');
    }
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    return retList.isEmpty ? null : retList;
  }

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);

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

  static Map<String,dynamic> staticSerialize
  (
    ExchangeOAuthRefreshTokenRequiredRequest request
  ) => _$ExchangeOAuthRefreshTokenRequiredRequestToJson(request);

  static ExchangeOAuthRefreshTokenRequiredRequest staticDeserialize
  (
    Map<String,dynamic> map
  ) => _$ExchangeOAuthRefreshTokenRequiredRequestFromJson(map);
  static Set<String>? staticValidate(ExchangeOAuthRefreshTokenRequiredRequest req) {
    Set<String> retList = {};
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    if(req.oAuthRefreshToken.isEmpty){
      retList.add('oauth_refresh_token');
    }
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    return retList.isEmpty ? null : retList;
  }

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeOAuthRefreshTokenRequiredRequest request){
    appendTo['oauth_refresh_token'] = request.oAuthRefreshToken;
    appendTo['user_unique_id'] = request.userUniqueId;
    appendTo['client_id'] = request.appClientId;
  }
}