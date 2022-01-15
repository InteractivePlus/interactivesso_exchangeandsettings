import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returneduserentity.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'modify_user_info.g.dart';


abstract class ModifyUserInfoRequestItem<T>{
  bool changeValue;
  T? value;
  validate();
  ModifyUserInfoRequestItem({required this.changeValue, required this.value});
}

@JsonSerializable()
class ModifyUserInfoRequestItemString implements ModifyUserInfoRequestItem<String?>{
  @override
  bool changeValue;

  @override
  String? value;

  @override
  bool validate() => changeValue == false || value != null;
  
  ModifyUserInfoRequestItemString({required this.changeValue, required this.value});
  factory ModifyUserInfoRequestItemString.fromJson(Map<String,dynamic> json) => _$ModifyUserInfoRequestItemStringFromJson(json);

  Map<String,dynamic> toJson() => _$ModifyUserInfoRequestItemStringToJson(this);
}

@JsonSerializable()
class ModifyUserInfoRequestItemStringNullable implements ModifyUserInfoRequestItem<String>{
  @override
  bool changeValue;

  @override
  String? value;

  @override
  bool validate() => true;
  
  ModifyUserInfoRequestItemStringNullable({required this.changeValue, required this.value});
  factory ModifyUserInfoRequestItemStringNullable.fromJson(Map<String,dynamic> json) => _$ModifyUserInfoRequestItemStringNullableFromJson(json);

  Map<String,dynamic> toJson() => _$ModifyUserInfoRequestItemStringNullableToJson(this);
}

@JsonSerializable()
class ModifyUserInfoRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required:true, name:'user_unique_id')
  @override
  String userUniqueId;

  ModifyUserInfoRequestItemString username;

  ModifyUserInfoRequestItemStringNullable nickname;

  ModifyUserInfoRequestItemStringNullable signature;

  @JsonKey(name: 'area')
  ModifyUserInfoRequestItemStringNullable areaAlpha2Code;

  @JsonKey(name: 'locale')
  ModifyUserInfoRequestItemStringNullable localeCode;

  @JsonKey(name: 'avatar_hash')
  ModifyUserInfoRequestItemStringNullable avatarHash;

  ModifyUserInfoRequest({
    required this.userUniqueId,
    required this.userAccessToken,
    required this.username,
    required this.nickname,
    required this.signature,
    required this.areaAlpha2Code,
    required this.localeCode,
    required this.avatarHash
  });
  factory ModifyUserInfoRequest.fromJson(Map<String,dynamic> map) => _$ModifyUserInfoRequestFromJson(map);
  Map<String,dynamic> toJson() => _$ModifyUserInfoRequestToJson(this);
  static Map<String,dynamic> serializeStatic(ModifyUserInfoRequest o) => o.toJson();
  static ModifyUserInfoRequest deserializeStatic(Map<String,dynamic> m) => ModifyUserInfoRequest.fromJson(m);
  static final serializeStaticWithSettings = ssoConvertToExchangeFormatFunc(serializeStatic);
  static final deserializeStaticWithSettings = ssoConvertToExchangeFormatFunc(deserializeStatic);
  static Set<String>? validateStatic<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ModifyUserInfoRequest o,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    if(o.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    if(o.userAccessToken.isEmpty){
      retList.add('user_access_token');
    }
    if(!o.areaAlpha2Code.validate()){
      retList.add('area');
    }
    if(!o.avatarHash.validate()){
      retList.add('avatar_hash');
    }
    if(!o.localeCode.validate()){
      retList.add('locale');
    }
    if(
      !o.nickname.validate()
      || (
         o.nickname.changeValue 
         && o.nickname.value != null 
         && !sharedSettings.validatorSettings.userSystemValidators.nicknameValidator.validate(o.nickname.value!)
      )
    ){
      retList.add('nickname');
    }
    if(
      !o.signature.validate()
      || (
        o.signature.changeValue
        && o.signature.value != null
        && !sharedSettings.validatorSettings.userSystemValidators.signatureValidator.validate(o.signature.value!)
      )
    ){
      retList.add('signature');
    }
    if(
      !o.username.validate()
      || (
        o.username.changeValue
        && o.username.value != null
        && !sharedSettings.validatorSettings.userSystemValidators.usernameValidator.validate(o.username.value!)
      )
    ){
      retList.add('username');
    }
    return retList.isEmpty ? null : retList;
  }
}

InteractiveSSOExchangeFormat<ModifyUserInfoRequest, ExchangedUserEntity, void, Map<String,dynamic>, Map<String,dynamic>, void> modifyUserInfoAPI = ExchangeFormat(
  exchangeProtocolName: 'modifyUserInfoAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>'
  ), 
  rateLimitMetaData: ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 3
  ), 
  parseRequest: ModifyUserInfoRequest.deserializeStaticWithSettings, 
  serializeRequest: ModifyUserInfoRequest.serializeStaticWithSettings, 
  validateRequest: ModifyUserInfoRequest.validateStatic,
  parseSuccessResponseData: ExchangedUserEntity.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedUserEntity.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);