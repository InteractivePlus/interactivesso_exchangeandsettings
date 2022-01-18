import 'package:json_annotation/json_annotation.dart';

import '../../interface/exchangeformat.dart';

part 'vericoderequiredrequest.g.dart';

@JsonSerializable()
class ExchangedVerificationCodeRequiredRequest{
  @JsonKey(required: true, name: 'vericode_id')
  String vericodeId;

  @JsonKey(required: true, name: 'is_vericode_short_id')
  bool isVericodeShortId;

  @JsonKey(required: true, name: 'user_unique_id')
  String userUniqueId;

  ExchangedVerificationCodeRequiredRequest({
    required this.vericodeId,
    required this.isVericodeShortId,
    required this.userUniqueId
  });
  factory ExchangedVerificationCodeRequiredRequest.fromMap(Map<String,dynamic> map) => _$ExchangedVerificationCodeRequiredRequestFromJson(map);
  static ExchangedVerificationCodeRequiredRequest fromJson(Map<String,dynamic> json) => ExchangedVerificationCodeRequiredRequest.fromMap(json);
  static ExchangedVerificationCodeRequiredRequest? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  static void appendToSerialize(Map<String, dynamic> toAppend, ExchangedVerificationCodeRequiredRequest request){
    toAppend['vericode_id'] = request.vericodeId;
    toAppend['is_vericode_short_id'] = request.isVericodeShortId;
    toAppend['user_unique_id'] = request.userUniqueId;
  }
  static Map<String,dynamic> staticSerialize(ExchangedVerificationCodeRequiredRequest request) => _$ExchangedVerificationCodeRequiredRequestToJson(request);
  static ExchangedVerificationCodeRequiredRequest staticDeserialize(Map<String,dynamic> json) => ExchangedVerificationCodeRequiredRequest.fromMap(json);
  static final staticSerializeWithSetting = ssoConvertToExchangeFormatFunc(staticSerialize);
  static Set<String>? validate
  (
    ExchangedVerificationCodeRequiredRequest req,
  ){
    Set<String> retList = {};
    if(req.vericodeId.isEmpty){
      retList.add('vericode_id');
    }
    if(req.userUniqueId.isEmpty){
      retList.add('user_unique_id');
    }
    return retList.isEmpty ? null : retList;
  }
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);

  static final staticDeserializeWithSetting = ssoConvertToExchangeFormatFunc(staticDeserialize);
}