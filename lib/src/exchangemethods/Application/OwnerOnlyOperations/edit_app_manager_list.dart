import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedappinfo.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'edit_app_manager_list.g.dart';

@JsonSerializable()
class EditAppManageListRequest implements ExchangedVerificationCodeRequiredRequest, ExchangeUserTokenRequiredRequest{
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
  
  @JsonKey(required: true, name: 'new_manager_list')
  Set<String> newManagerListExcludingOwner;

  EditAppManageListRequest({
    required this.isVericodeShortId,
    required this.vericodeId,
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId,
    required this.newManagerListExcludingOwner
  });
  factory EditAppManageListRequest.fromJson(Map<String,dynamic> json) => _$EditAppManageListRequestFromJson(json);
  Map<String,dynamic> toJson() => _$EditAppManageListRequestToJson(this);
  static Map<String,dynamic> staticSerialize(EditAppManageListRequest req) => req.toJson();
  static EditAppManageListRequest staticDeserialize(Map<String,dynamic> serialized) => EditAppManageListRequest.fromJson(serialized);
  static Set<String>? staticValidate(EditAppManageListRequest req){
    Set<String> retList = {};
    var veriCodeRst = ExchangedVerificationCodeRequiredRequest.validate(req);
    var tokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(veriCodeRst != null){
      retList.addAll(veriCodeRst);
    }
    if(tokenRst != null){
      retList.addAll(tokenRst);
    }
    if(req.appClientId.isEmpty){
      retList.add('client_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<EditAppManageListRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> editAppManageList = ExchangeFormat(
  exchangeProtocolName: 'editAppManageList', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/manager_list'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 5
    ), 
    parseRequest: EditAppManageListRequest.staticDeserializeWithSettings, 
    serializeRequest: EditAppManageListRequest.staticSerializeWithSettings, 
    validateRequest: EditAppManageListRequest.staticValidateWithSettings,
    parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: true,
    requiredVerificationCodeScope: 'editApp'
  );