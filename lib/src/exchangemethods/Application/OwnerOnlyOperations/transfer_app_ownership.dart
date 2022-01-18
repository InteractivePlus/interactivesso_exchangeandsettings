import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedappinfo.dart';
import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/vericoderequiredrequest.dart';
import '../../../interface/exchangeformat.dart';

part 'transfer_app_ownership.g.dart';

@JsonSerializable()
class TransferAPPOwnershipRequest implements ExchangedVerificationCodeRequiredRequest, ExchangeUserTokenRequiredRequest{
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
  
  ///This UID must be already present in the manager list
  @JsonKey(required: true, name: 'new_owner_unique_id')
  String newOwnerUserUniqueId;

  TransferAPPOwnershipRequest({
    required this.isVericodeShortId,
    required this.vericodeId,
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId,
    required this.newOwnerUserUniqueId
  });
  factory TransferAPPOwnershipRequest.fromJson(Map<String,dynamic> json) => _$TransferAPPOwnershipRequestFromJson(json);
  Map<String,dynamic> toJson() => _$TransferAPPOwnershipRequestToJson(this);
  static Map<String,dynamic> staticSerialize(TransferAPPOwnershipRequest req) => req.toJson();
  static TransferAPPOwnershipRequest staticDeserialize(Map<String,dynamic> serialized) => TransferAPPOwnershipRequest.fromJson(serialized);
  static Set<String>? staticValidate(TransferAPPOwnershipRequest req){
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
    if(req.newOwnerUserUniqueId.isEmpty){
      retList.add('new_owner_unique_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final staticValidateWithSettings = ssoConvertToExchangeFormatFunc(staticValidate);
}

InteractiveSSOExchangeFormat<TransferAPPOwnershipRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> transferAppOwnershipAPI = ExchangeFormat(
  exchangeProtocolName: 'transferAppOwnershipAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/owner'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 5
    ), 
    parseRequest: TransferAPPOwnershipRequest.staticDeserializeWithSettings, 
    serializeRequest: TransferAPPOwnershipRequest.staticSerializeWithSettings, 
    validateRequest: TransferAPPOwnershipRequest.staticValidateWithSettings,
    parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: true,
    requiredVerificationCodeScope: 'editApp'
  );