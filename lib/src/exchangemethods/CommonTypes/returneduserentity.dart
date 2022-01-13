import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

part 'returneduserentity.g.dart';

@JsonSerializable(includeIfNull: false)
class ExchangedUserEntity implements Serializable<Map<String,dynamic>>{
  
  @JsonKey(required: true, name: 'username')
  String username;

  @JsonKey(required: true, name: 'user_unique_id')
  final String userUniqueId;

  @JsonKey(name: 'email')
  String? email;

  @JsonKey(required: true, name: 'email_verified')
  bool emailVerified;
  
  @JsonKey(name: 'phone')
  @NullablePhoneNumberConverter()
  PhoneNumber? phoneNumber;

  @JsonKey(required: true, name: 'phone_verified')
  bool phoneVerified;

  @JsonKey(required: true, name: 'account_status', fromJson: AccountStatus.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AccountStatus accountStatus;

  @JsonKey(name: 'nickname')
  String? nickname;

  @JsonKey(name: 'signature')
  String? signature;

  @JsonKey(name: 'area')
  String? areaAlpha2Code;

  @JsonKey(name:'locale')
  String? localeCode;

  @JsonKey(name: 'avatar_hash')
  String? avatarHash;

  @JsonKey(required: true, name:'account_create_info', fromJson: AccountCreateInfo.fromJson, toJson: Serializable.convertToDynamicSerialized)
  AccountCreateInfo accountCreateInfo;

  ///This is not permission, it's ALL permission combined, and should be a solid permission.
  @JsonKey(required: true, name:'permission')
  UserPermissionInfo permission;

  @JsonKey(ignore: true)
  String get displayName => nickname ?? username;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangedUserEntityToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  ExchangedUserEntity({
    required this.username, 
    required this.userUniqueId,
    this.email, 
    this.phoneNumber, 
    required this.accountCreateInfo,
    required this.permission,
    this.accountStatus = AccountStatus.NORMAL, 
    this.emailVerified = false,
    this.phoneVerified = false,
    this.nickname,
    this.signature,
    this.areaAlpha2Code,
    this.localeCode,
    this.avatarHash
  });

  factory ExchangedUserEntity.fromMap(Map<String,dynamic> map) => _$ExchangedUserEntityFromJson(map);

  static ExchangedUserEntity fromJson(Map<String,dynamic> json) => ExchangedUserEntity.fromMap(json);
  static ExchangedUserEntity? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  static Map<String,dynamic> staticSerialize(ExchangedUserEntity user) => user.toJson();
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(fromJson);
}

@JsonSerializable(includeIfNull: false)
class ExchangedSimpleUserInfo implements Serializable<Map<String,dynamic>>{
  @JsonKey(required: true, name: 'user_unique_id')
  final String userUniqueId;

  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(name: 'signature')
  String? signature;

  @JsonKey(name: 'area')
  String? areaAlpha2Code;

  @JsonKey(name:'local')
  String? localeCode;

  @JsonKey(name: 'avatar_hash')
  String? avatarHash;

  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangedSimpleUserInfoToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);

  ExchangedSimpleUserInfo({
    required this.userUniqueId,
    required this.displayName,
    this.signature,
    this.areaAlpha2Code,
    this.localeCode,
    this.avatarHash
  });

  factory ExchangedSimpleUserInfo.fromMap(Map<String,dynamic> map) => _$ExchangedSimpleUserInfoFromJson(map);
  static ExchangedUserEntity fromJson(Map<String,dynamic> json) => ExchangedUserEntity.fromMap(json);
  static ExchangedUserEntity? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}