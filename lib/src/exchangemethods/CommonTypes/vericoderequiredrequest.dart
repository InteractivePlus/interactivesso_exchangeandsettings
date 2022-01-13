import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vericoderequiredrequest.g.dart';

@JsonSerializable()
class ExchangedVerificationCodeRequiredRequest{
  @JsonKey(required: true, name: 'vericode_id')
  String vericodeId;

  @JsonKey(required: true, name: 'is_vericode_short_id')
  bool isVericodeShortId;

  @JsonKey(required: true, name: 'vericode_user_unique_id')
  String vericodeUserUniqueId;

  ExchangedVerificationCodeRequiredRequest({
    required this.vericodeId,
    required this.isVericodeShortId,
    required this.vericodeUserUniqueId
  });
  factory ExchangedVerificationCodeRequiredRequest.fromMap(Map<String,dynamic> map) => _$ExchangedVerificationCodeRequiredRequestFromJson(map);
  static ExchangedVerificationCodeRequiredRequest fromJson(Map<String,dynamic> json) => ExchangedVerificationCodeRequiredRequest.fromMap(json);
  static ExchangedVerificationCodeRequiredRequest? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);

  static void appendToSerialize(Map<String, dynamic> toAppend, ExchangedVerificationCodeRequiredRequest request){
    toAppend['vericode_id'] = request.vericodeId;
    toAppend['is_vericode_short_id'] = request.isVericodeShortId;
    toAppend['vericode_user_unique_id'] = request.vericodeUserUniqueId;
  }
  static Map<String,dynamic> staticSerialize(ExchangedVerificationCodeRequiredRequest request) => _$ExchangedVerificationCodeRequiredRequestToJson(request);
  static ExchangedVerificationCodeRequiredRequest staticDeserialize(Map<String,dynamic> json) => ExchangedVerificationCodeRequiredRequest.fromMap(json);
  static Map<String,dynamic> staticSerializeWithSetting<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangedVerificationCodeRequiredRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    return staticSerialize(req);
  }
  static List<String>? validateWithSetting<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangedVerificationCodeRequiredRequest req,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    List<String> retList = List.empty(growable: true);
    if(req.vericodeId.isEmpty){
      retList.add('vericode_id');
    }
    if(req.vericodeUserUniqueId.isEmpty){
      retList.add('vericodeUserUniqueId');
    }
    return retList.isEmpty ? null : retList;
  }

  static ExchangedVerificationCodeRequiredRequest staticDeserializeWithSetting<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    Map<String,dynamic> serialized,
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    return staticDeserialize(serialized);
  }

}