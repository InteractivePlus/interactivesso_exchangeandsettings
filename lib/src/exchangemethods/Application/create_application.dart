import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedappinfo.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_application.g.dart';

@JsonSerializable()
class CreateApplicationRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'display_name')
  String displayName;

  @JsonKey(required: true, name: 'description')
  String description;

  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  CreateApplicationRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    required this.displayName,
    required this.description
  });
  factory CreateApplicationRequest.fromJson(Map<String,dynamic> json) => _$CreateApplicationRequestFromJson(json);
  Map<String,dynamic> toJson() => _$CreateApplicationRequestToJson(this);

  static Map<String,dynamic> staticSerialize(CreateApplicationRequest req) => req.toJson();
  static CreateApplicationRequest staticDeserialize(Map<String,dynamic> serialized) => CreateApplicationRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    CreateApplicationRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(!sharedSettings.validatorSettings.appSystemValidators.appDisplayNameValidator.validate(req.displayName)){
      retList.add('display_name');
    }
    if(!sharedSettings.validatorSettings.appSystemValidators.appDescriptionValidator.validate(req.description)){
      retList.add('description');
    }
    return retList.isEmpty ? null : retList;
  }
}

InteractiveSSOExchangeFormat<CreateApplicationRequest, ExchangedReturnedAppInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> createApplicationAPI = ExchangeFormat(
  exchangeProtocolName: 'createApplicationAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 409, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/apps/<display_name>'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: CreateApplicationRequest.staticDeserializeWithSettings, 
  serializeRequest: CreateApplicationRequest.staticSerializeWithSettings, 
  validateRequest: CreateApplicationRequest.staticValidateWithSettings, 
  parseSuccessResponseData: ExchangedReturnedAppInfo.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedReturnedAppInfo.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);