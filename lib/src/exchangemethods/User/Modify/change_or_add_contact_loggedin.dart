import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_or_add_contact_loggedin.g.dart';

@JsonSerializable(includeIfNull: false)
class ChangeOrAddContactMethodLoggedInParameter implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? preferredMethod;

  @JsonKey(name: 'force_preferred_method')
  bool forcePreferredMethod;

  ChangeOrAddContactMethodLoggedInParameter({
    required this.userAccessToken,
    required this.userUniqueId,
    this.preferredMethod,
    this.forcePreferredMethod = false
  });

  factory ChangeOrAddContactMethodLoggedInParameter.fromJson(Map<String,dynamic> json) => _$ChangeOrAddContactMethodLoggedInParameterFromJson(json);
  Map<String,dynamic> toJson() => _$ChangeOrAddContactMethodLoggedInParameterToJson(this);

  static Map<String,dynamic> staticSerialize(ChangeOrAddContactMethodLoggedInParameter o) => o.toJson();
  static ChangeOrAddContactMethodLoggedInParameter staticDeserialize(Map<String,dynamic> map) => ChangeOrAddContactMethodLoggedInParameter.fromJson(map);
  static List<String>? validate(ChangeOrAddContactMethodLoggedInParameter o){
    return ExchangeUserTokenRequiredRequest.validate(o);
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
} 

InteractiveSSOExchangeFormat<ChangeOrAddContactMethodLoggedInParameter, CommunicationMethod, void, Map<String,dynamic>, String, void> changeOrAddContact_LoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'changeOrAddContact_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verfication_messages/change_or_add_contact_logged_in'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ChangeOrAddContactMethodLoggedInParameter.staticDeserializeWithSettings, 
  serializeRequest: ChangeOrAddContactMethodLoggedInParameter.staticSerializeWithSettings, 
  validateRequest: ChangeOrAddContactMethodLoggedInParameter.validateWithSettings,
  parseSuccessResponseData: ssoConvertToExchangeFormatFunc(CommunicationMethod.fromJson), 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoConvertToExchangeFormatFunc(Serializable.convertToSerialized), 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);