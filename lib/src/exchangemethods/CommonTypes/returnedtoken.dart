import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../interface/exchangeformat.dart';

part 'returnedtoken.g.dart';

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

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangedReturnedUserTokenToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  ExchangedReturnedUserToken({
    required this.userUniqueId,
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

  static Map<String,dynamic> staticSerialize
  (
    ExchangeUserTokenRequiredRequest request
  ) => _$ExchangeUserTokenRequiredRequestToJson(request);

  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);

  static ExchangeUserTokenRequiredRequest staticDeserialize
  (
    Map<String,dynamic> map,
  ) => _$ExchangeUserTokenRequiredRequestFromJson(map);

  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeUserTokenRequiredRequest request){
    appendTo['user_access_token'] = request.userAccessToken;
    appendTo['user_unique_id'] = request.userUniqueId;
  }
  static Set<String>? validate(ExchangeUserTokenRequiredRequest req){
    Set<String> retList = {};
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }else if(req.userAccessToken.isEmpty){
      retList.add('user_access_token');
    }
    return retList.isEmpty ? null : retList;
  }
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
}

@JsonSerializable()
class ExchangeUserRefreshTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_refresh_token')
  String userRefreshToken;
  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  ExchangeUserRefreshTokenRequiredRequest({required this.userRefreshToken, required this.userUniqueId});

  static Map<String,dynamic> staticSerialize
  (
    ExchangeUserRefreshTokenRequiredRequest request
  ) => _$ExchangeUserRefreshTokenRequiredRequestToJson(request);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);

  static ExchangeUserRefreshTokenRequiredRequest staticDeserialize
  (
    Map<String,dynamic> map
  ) => _$ExchangeUserRefreshTokenRequiredRequestFromJson(map);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);

  static void appendSerialize(Map<String,dynamic> appendTo, ExchangeUserRefreshTokenRequiredRequest request){
    appendTo['user_refresh_token'] = request.userRefreshToken;
    appendTo['user_unique_id'] = request.userUniqueId;
  }
  static List<String>? validate(ExchangeUserRefreshTokenRequiredRequest req){
    List<String> retList = List.empty(growable: true);
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }else if(req.userRefreshToken.isEmpty){
      retList.add('user_refresh_token');
    }
    return retList.isEmpty ? null : retList;
  }
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
}