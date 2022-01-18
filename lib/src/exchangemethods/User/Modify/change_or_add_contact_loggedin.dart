import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/sendvericoderequest.dart';
import '../../../interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change_or_add_contact_loggedin.g.dart';

@JsonSerializable(includeIfNull: false)
class ChangeOrAddContactMethodLoggedInRequest implements ExchangeSendVericodeWithPreferredMethodRequest, ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  @override
  CommunicationMethod? preferredMethod;

  @JsonKey(name: 'force_preferred_method')
  @override
  bool forcePreferredMethod;

  ChangeOrAddContactMethodLoggedInRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.preferredMethod,
    this.forcePreferredMethod = false
  });

  factory ChangeOrAddContactMethodLoggedInRequest.fromJson(Map<String,dynamic> json) => _$ChangeOrAddContactMethodLoggedInRequestFromJson(json);
  @override
  Map<String,dynamic> toJson() => _$ChangeOrAddContactMethodLoggedInRequestToJson(this);

  static Map<String,dynamic> staticSerialize(ChangeOrAddContactMethodLoggedInRequest o) => o.toJson();
  static ChangeOrAddContactMethodLoggedInRequest staticDeserialize(Map<String,dynamic> map) => ChangeOrAddContactMethodLoggedInRequest.fromJson(map);
  static Set<String>? validate(ChangeOrAddContactMethodLoggedInRequest o) => ExchangeUserTokenRequiredRequest.validate(o);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
} 

InteractiveSSOExchangeFormat<ChangeOrAddContactMethodLoggedInRequest, CommunicationMethod, void, Map<String,dynamic>, String, void> changeOrAddContact_LoggedIn_API = ExchangeFormat(
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
  parseRequest: ChangeOrAddContactMethodLoggedInRequest.staticDeserializeWithSettings, 
  serializeRequest: ChangeOrAddContactMethodLoggedInRequest.staticSerializeWithSettings, 
  validateRequest: ChangeOrAddContactMethodLoggedInRequest.validateWithSettings,
  parseSuccessResponseData: ssoConvertToExchangeFormatFunc(CommunicationMethod.fromJson), 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoConvertToExchangeFormatFunc(Serializable.convertToSerialized), 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);