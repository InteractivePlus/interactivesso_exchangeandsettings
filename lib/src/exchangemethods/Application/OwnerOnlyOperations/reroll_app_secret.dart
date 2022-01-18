
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../CommonTypes/returnedappinfo.dart';
import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/vericoderequiredrequest.dart';
import '../../../interface/exchangeformat.dart';

part 'reroll_app_secret.g.dart';

@JsonSerializable()
class RerollAppSecretRequest implements ExchangedVerificationCodeRequiredRequest, ExchangeUserTokenRequiredRequest{
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

  RerollAppSecretRequest({
    required this.isVericodeShortId,
    required this.vericodeId,
    required this.userUniqueId,
    required this.userAccessToken,
    required this.appClientId
  });
  factory RerollAppSecretRequest.fromJson(Map<String,dynamic> json) => _$RerollAppSecretRequestFromJson(json);
  Map<String,dynamic> toJson() => _$RerollAppSecretRequestToJson(this);
  static Map<String,dynamic> staticSerialize(RerollAppSecretRequest req) => req.toJson();
  static RerollAppSecretRequest staticDeserialize(Map<String,dynamic> serialized) => RerollAppSecretRequest.fromJson(serialized);
  static Set<String>? staticValidate(RerollAppSecretRequest req){
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

InteractiveSSOExchangeFormat<RerollAppSecretRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> rerollAppSecretAPI = ExchangeFormat(
  exchangeProtocolName: 'rerollAppSecretAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/apps/<client_id>/client_secret'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 2
    ), 
    parseRequest: RerollAppSecretRequest.staticDeserializeWithSettings, 
    serializeRequest: RerollAppSecretRequest.staticSerializeWithSettings, 
    validateRequest: RerollAppSecretRequest.staticValidateWithSettings,
    parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: true,
    requiredVerificationCodeScope: 'editApp'
  );