
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returneduserentity.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';

part 'change_or_add_contact_apply_loggedin.g.dart';

@JsonSerializable()
class ChangeOrAddContactApplyLoggedInRequest implements ExchangedVerificationCodeRequiredRequest,ExchangeUserTokenRequiredRequest{
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

  @JsonKey(required: true, name: 'vericode_user_unique_id')
  @override
  String vericodeUserUniqueId;

  @JsonKey(required: true, name: 'change_phone')
  bool changePhone;

  @JsonKey(name: 'new_email')
  String? newEmail;

  @JsonKey(name: 'new_phone')
  @NullablePhoneNumberConverter()
  PhoneNumber? newPhoneNum;

  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? preferredMethod;

  @JsonKey(name: 'force_preferred_method')
  bool forcePreferredMethod;

  ChangeOrAddContactApplyLoggedInRequest({
    required this.vericodeUserUniqueId,
    required this.vericodeId,
    required this.isVericodeShortId,
    required this.userAccessToken,
    required this.userUniqueId,
    required this.changePhone,
    required this.forcePreferredMethod,
    this.preferredMethod,
    this.newEmail,
    this.newPhoneNum
  });
  factory ChangeOrAddContactApplyLoggedInRequest.fromJson(Map<String,dynamic> json) => _$ChangeOrAddContactApplyLoggedInRequestFromJson(json);
  Map<String,dynamic> toJson() => _$ChangeOrAddContactApplyLoggedInRequestToJson(this);

  static Map<String,dynamic> staticSerialize(ChangeOrAddContactApplyLoggedInRequest o) => o.toJson();
  static ChangeOrAddContactApplyLoggedInRequest staticDeserialize(Map<String,dynamic> m) => ChangeOrAddContactApplyLoggedInRequest.fromJson(m);
  static List<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ChangeOrAddContactApplyLoggedInRequest o,
    FineSetting sharedSetting
  ){
    List<String> retList = List.empty(growable: true);
    var vericodeRst = ExchangedVerificationCodeRequiredRequest.validate(o);
    if(vericodeRst != null){
      retList.addAll(vericodeRst);
    }
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(o);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(o.preferredMethod != null &&
      (
        (o.changePhone && o.preferredMethod!.verifyTarget != PhoneOrEmail.phone)
        || (!o.changePhone && o.preferredMethod!.verifyTarget != PhoneOrEmail.email)
      )
    ){
      retList.add('preferred_method');
    }
    if(o.changePhone && o.newPhoneNum != null && !o.newPhoneNum!.validate()){
      retList.add('new_phone');
    }
    if(!o.changePhone && o.newEmail != null && !sharedSetting.validatorSettings.userSystemValidators.emailValidator.validate(o.newEmail!)){
      retList.add('new_mail');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}

InteractiveSSOExchangeFormat<ChangeOrAddContactApplyLoggedInRequest, ExchangedUserEntity, void, Map<String,dynamic>, Map<String,dynamic>, void> changeOrAddContactApply_LoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'changeOrAddContactApply_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.PATCH, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/{user_unique_id}/contact_method'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 5
  ), 
  parseRequest: ChangeOrAddContactApplyLoggedInRequest.staticDeserializeWithSettings, 
  serializeRequest: ChangeOrAddContactApplyLoggedInRequest.staticSerializeWithSettings, 
  validateRequest: ChangeOrAddContactApplyLoggedInRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedUserEntity.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedUserEntity.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: true,
  requiredVerificationCodeScope: 'changeContactApply_LoggedIn_API'
);