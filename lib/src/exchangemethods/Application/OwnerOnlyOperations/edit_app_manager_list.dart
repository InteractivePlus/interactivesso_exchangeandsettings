import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../interface/exchangeformat.dart';
import '../..//CommonTypes/returnedappinfo.dart';
import '../..//CommonTypes/returnedtoken.dart';
import '../..//CommonTypes/vericoderequiredrequest.dart';

part 'edit_app_manager_list.g.dart';

@JsonSerializable()
class EditAppManagerListRequest implements ExchangedVerificationCodeRequiredRequest, ExchangeUserTokenRequiredRequest{
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

  EditAppManagerListRequest({
    required this.isVericodeShortId,
    required this.vericodeId,
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId,
    required this.newManagerListExcludingOwner
  });
  factory EditAppManagerListRequest.fromJson(Map<String,dynamic> json) => _$EditAppManagerListRequestFromJson(json);
  Map<String,dynamic> toJson() => _$EditAppManagerListRequestToJson(this);
  static Map<String,dynamic> staticSerialize(EditAppManagerListRequest req) => req.toJson();
  static EditAppManagerListRequest staticDeserialize(Map<String,dynamic> serialized) => EditAppManagerListRequest.fromJson(serialized);
  static Set<String>? staticValidate(EditAppManagerListRequest req){
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

InteractiveSSOExchangeFormat<EditAppManagerListRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> editAppManagerListAPI = ExchangeFormat(
  exchangeProtocolName: 'editAppManagerListAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/manager_list'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 5
    ), 
    parseRequest: EditAppManagerListRequest.staticDeserializeWithSettings, 
    serializeRequest: EditAppManagerListRequest.staticSerializeWithSettings, 
    validateRequest: EditAppManagerListRequest.staticValidateWithSettings,
    parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: true,
    requiredVerificationCodeScope: 'editApp'
  );