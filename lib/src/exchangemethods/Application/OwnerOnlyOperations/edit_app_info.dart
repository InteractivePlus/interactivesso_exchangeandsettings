import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/modifyrequestparam.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedappinfo.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_app_info.g.dart';

@JsonSerializable()
class EditAppInfoRequest implements ExchangedVerificationCodeRequiredRequest, ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'is_vericode_short_id')
  @override
  bool isVericodeShortId;

  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required: true, name: 'vericode_id')
  @override
  String vericodeId;
  
  @JsonKey(required: true, name: 'client_id')
  String appClientId;

  @JsonKey(required: true, name: 'display_name')
  ModifyRequestParamItemString displayName;

  @JsonKey(required: true, name: 'description')
  ModifyRequestParamItemString description;

  @JsonKey(name: 'avatar_hash')
  ModifyRequestParamItemStringNullable avatarHash;

  EditAppInfoRequest({
    required this.isVericodeShortId,
    required this.userUniqueId,
    required this.vericodeId,
    required this.userAccessToken,
    required this.appClientId,
    required this.displayName,
    required this.description,
    required this.avatarHash
  });
  factory EditAppInfoRequest.fromJson(Map<String,dynamic> json) => _$EditAppInfoRequestFromJson(json);
  Map<String,dynamic> toJson() => _$EditAppInfoRequestToJson(this);
  static Map<String,dynamic> staticSerialize(EditAppInfoRequest req) => req.toJson();
  static EditAppInfoRequest staticDeserialize(Map<String,dynamic> serialized) => EditAppInfoRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    EditAppInfoRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var veriCodeRst = ExchangedVerificationCodeRequiredRequest.validate(req);
    var tokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(veriCodeRst != null){
      retList.addAll(veriCodeRst);
    }
    if(tokenRst != null){
      retList.addAll(tokenRst);
    }
    if(!req.displayName.validate() || (req.displayName.changeValue && !sharedSettings.validatorSettings.appSystemValidators.appDisplayNameValidator.validate(req.displayName.value!))){
      retList.add('display_name');
    }
    if(!req.description.validate() || (req.description.changeValue && !sharedSettings.validatorSettings.appSystemValidators.appDescriptionValidator.validate(req.description.value!))){
      retList.add('description');
    }
    if(!req.avatarHash.validate()){
      retList.add('avatar_hash');
    }
    return retList.isEmpty ? null : retList;
  }
}

InteractiveSSOExchangeFormat<EditAppInfoRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> editAPPInfoAPI = ExchangeFormat(
  exchangeProtocolName: 'editAPPInfoAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/apps/<client_id>'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 10
  ), 
  parseRequest: EditAppInfoRequest.staticDeserializeWithSettings, 
  serializeRequest: EditAppInfoRequest.staticSerializeWithSettings, 
  validateRequest: EditAppInfoRequest.staticValidateWithSettings,
  parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: true,
  requiredVerificationCodeScope: 'editApp'
);