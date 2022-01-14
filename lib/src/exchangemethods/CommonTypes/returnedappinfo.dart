import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'returnedappinfo.g.dart';

@JsonSerializable(includeIfNull: false)
class ExchangedReturnedAppInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'client_id')
  String clientId;

  @JsonKey(required: true, name: 'client_secret')
  String clientSecret;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(required: true, name: 'description')
  String description;

  @JsonKey(required: true, name: 'permission')
  APPPermissionInfo permission;

  @JsonKey(required: true, name: 'creation_info')
  ApplicationCreationInfo creationInfo;

  @JsonKey(required: true, name: 'manage_info')
  ApplicationManagementInfo manageInfo;

  @JsonKey(required: true, name: 'is_normal_app')
  bool isNormalAPP;

  @JsonKey(name: 'avatar_hash')
  String? avatarHash;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ExchangedReturnedAppInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ExchangedReturnedAppInfo({
    required this.clientId, 
    required this.clientSecret, 
    required this.displayName, 
    required this.description, 
    required this.permission, 
    required this.creationInfo, 
    required this.manageInfo,
    required this.isNormalAPP,
    this.avatarHash
  });

  factory ExchangedReturnedAppInfo.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedAppInfoFromJson(map);
  static ExchangedReturnedAppInfo fromJson(Map<String,dynamic> json) => ExchangedReturnedAppInfo.fromMap(json);
  static ExchangedReturnedAppInfo? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }
  static Map<String,dynamic> staticSerialize(ExchangedReturnedAppInfo inf) => inf.toJson();
  static ExchangedReturnedAppInfo staticDeserialize(Map<String,dynamic> map) => ExchangedReturnedAppInfo.fromJson(map);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}

@JsonSerializable(includeIfNull: false)
class ExchangedReturnedAppSimpleInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'client_id')
  String clientId;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(required: true, name: 'description')
  String description;

  @JsonKey(required: true, name: 'oauth_permission')
  OAuthPermissionInfo oAuthPermission;

  @JsonKey(required: true, name: 'is_normal_app')
  bool isNormalAPP;

  @JsonKey(name: 'avatar_hash')
  String? avatarHash;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ExchangedReturnedAppSimpleInfoToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ExchangedReturnedAppSimpleInfo({
    required this.clientId,  
    required this.displayName, 
    required this.description, 
    required this.oAuthPermission,
    required this.isNormalAPP,
    this.avatarHash
  });

  factory ExchangedReturnedAppSimpleInfo.fromMap(Map<String,dynamic> map) => _$ExchangedReturnedAppSimpleInfoFromJson(map);
  static ExchangedReturnedAppSimpleInfo fromJson(Map<String,dynamic> json) => ExchangedReturnedAppSimpleInfo.fromMap(json);
  static ExchangedReturnedAppSimpleInfo? fromJsonNullable(Map<String,dynamic>? json){
    if(json == null){
      return null;
    }else{
      return fromJson(json);
    }
  }
}