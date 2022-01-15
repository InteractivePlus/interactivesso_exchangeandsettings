import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resetuserpassword.g.dart';

@JsonSerializable()
class ResetUserPasswordRequest implements ExchangedVerificationCodeRequiredRequest{
  @JsonKey(required: true, name: 'vericode_id')
  @override
  bool isVericodeShortId;

  @JsonKey(required: true, name: 'is_vericode_short_id')
  @override
  String vericodeId;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(required: true, name: 'new_password')
  String newPassword;

  ResetUserPasswordRequest({
    required this.isVericodeShortId,
    required this.vericodeId,
    required this.userUniqueId,
    required this.newPassword
  });
  factory ResetUserPasswordRequest.fromJson(Map<String,dynamic> json) => _$ResetUserPasswordRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ResetUserPasswordRequestToJson(this);
  static Map<String,dynamic> staticSerialize(ResetUserPasswordRequest req) => req.toJson();
  static ResetUserPasswordRequest staticDeserialize(Map<String,dynamic> serialized) => ResetUserPasswordRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? validateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ResetUserPasswordRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var veriCodeResult = ExchangedVerificationCodeRequiredRequest.validate(req);
    if(veriCodeResult != null){
      retList.addAll(veriCodeResult);
    }
    if(!sharedSettings.validatorSettings.userSystemValidators.passwordFormatValidator.validate(req.newPassword)){
      retList.add('new_password');
    }
    return retList.isEmpty ? null : retList;
  }
}