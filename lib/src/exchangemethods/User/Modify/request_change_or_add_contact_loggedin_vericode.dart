import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import '../../CommonTypes/returnedtoken.dart';
import '../../CommonTypes/sendvericoderequest.dart';
import '../../../interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'request_change_or_add_contact_loggedin_vericode.g.dart';

@JsonSerializable(includeIfNull: false)
class RequestChangeOrAddContactMethodLoggedInVericodeRequest implements ExchangeSendVericodeWithPreferredMethodRequest, ExchangeUserTokenRequiredRequest{
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

  RequestChangeOrAddContactMethodLoggedInVericodeRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    this.preferredMethod,
    this.forcePreferredMethod = false
  });

  factory RequestChangeOrAddContactMethodLoggedInVericodeRequest.fromJson(Map<String,dynamic> json) => _$RequestChangeOrAddContactMethodLoggedInVericodeRequestFromJson(json);
  @override
  Map<String,dynamic> toJson() => _$RequestChangeOrAddContactMethodLoggedInVericodeRequestToJson(this);

  static Map<String,dynamic> staticSerialize(RequestChangeOrAddContactMethodLoggedInVericodeRequest o) => o.toJson();
  static RequestChangeOrAddContactMethodLoggedInVericodeRequest staticDeserialize(Map<String,dynamic> map) => RequestChangeOrAddContactMethodLoggedInVericodeRequest.fromJson(map);
  static Set<String>? validate(RequestChangeOrAddContactMethodLoggedInVericodeRequest o) => ExchangeUserTokenRequiredRequest.validate(o);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
} 

InteractiveSSOExchangeFormat<RequestChangeOrAddContactMethodLoggedInVericodeRequest, CommunicationMethod, void, Map<String,dynamic>, String, void> requestChangeOrAddContactLoggedInVericode_API = ExchangeFormat(
  exchangeProtocolName: 'requestChangeOrAddContactLoggedInVericode_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'user/<user_unique_id>/verfication_messages/change_or_add_contact_logged_in'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: RequestChangeOrAddContactMethodLoggedInVericodeRequest.staticDeserializeWithSettings, 
  serializeRequest: RequestChangeOrAddContactMethodLoggedInVericodeRequest.staticSerializeWithSettings, 
  validateRequest: RequestChangeOrAddContactMethodLoggedInVericodeRequest.validateWithSettings,
  parseSuccessResponseData: ssoConvertToExchangeFormatFunc(CommunicationMethod.fromJson), 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoConvertToExchangeFormatFunc(Serializable.convertToSerialized), 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);