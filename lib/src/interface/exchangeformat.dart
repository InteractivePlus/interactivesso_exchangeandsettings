
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

part 'exchangeformat.g.dart';

class ExchangeResponse<SuccessData, FailData>{
  InteractivePlusSystemException? exception;
  SuccessData? data;
  FailData? failData;
  ExchangeResponse({
    this.exception,
    this.data,
    this.failData
  });
  static ExchangeResponse<SuccessData, FailedData> fromMap<SuccessData, FailedData, SuccessDataSerialized, FailedDataSerialized>(
    Map<String,dynamic> map,
    SuccessData Function(SuccessDataSerialized data) successDataDeserializer,
    FailedData Function(FailedDataSerialized data) failedDataDeserializer
  ){
    return ExchangeResponse<SuccessData, FailedData>(
      exception: InteractivePlusSystemException.fromJsonNullable(map['exception']),
      data: map['data'] == null ? null : successDataDeserializer(map['data'] as SuccessDataSerialized),
      failData: map['failed_data'] == null ? null : failedDataDeserializer(map['failed_data'] as FailedDataSerialized)
    );
  }
  static Map<String,dynamic> serialize<SuccessData, FailedData, SuccessDataSerialized, FailedDataSerialized>(
    ExchangeResponse<SuccessData, FailedData> response, 
    SuccessDataSerialized Function(SuccessData data) successDataSerializer,
    FailedDataSerialized Function(FailedData data) failedDataSerializer
  ){
    Map<String,dynamic> returnMap = {};
    if(response.exception != null){
      returnMap['exception'] = response.exception!.toJson();
    }
    if(response.data != null){
      returnMap['data'] = successDataSerializer(response.data!);
    }
    if(response.failData != null){
      returnMap['failed_data'] = failedDataSerializer(response.failData!);
    }
    return returnMap;
  }
}

@JsonSerializable(includeIfNull: false)
class InternationalilzedExchangeRequest{
  @JsonKey(name: 'preferred_locale')
  String? preferredLocale;

  InternationalilzedExchangeRequest({this.preferredLocale});

  static void appendSerialize(Map<String,dynamic> toAppendTo, InternationalilzedExchangeRequest object){
    if(object.preferredLocale != null){
      toAppendTo['preferred_locale'] = object.preferredLocale;
    }
  }

  static List<String>? validate<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    InternationalilzedExchangeRequest request, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ){
    return null;
  }
}

@JsonEnum()
enum ExchangeHTTPMethod{
  GET,
  POST,
  PUT,
  DELETE,
  PATCH
}

@JsonSerializable()
class ExchangeHTTPMetaData implements Serializable<Map<String,dynamic>>{
  final int successfulHTTPCode;
  final List<int> possibleHTTPCodes;
  final String relativePathWithParameterMarkedWithLtAndGtSymbols;
  final ExchangeHTTPMethod method;
  const ExchangeHTTPMetaData({
    required this.method,
    required this.successfulHTTPCode,
    required this.possibleHTTPCodes,
    required this.relativePathWithParameterMarkedWithLtAndGtSymbols
  });
  factory ExchangeHTTPMetaData.fromMap(Map<String,dynamic> map) => _$ExchangeHTTPMetaDataFromJson(map);
  static ExchangeHTTPMetaData fromJson(Map<String,dynamic> json) => ExchangeHTTPMetaData.fromMap(json);
  static ExchangeHTTPMetaData? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  
  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangeHTTPMetaDataToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

@JsonSerializable()
class ExchangeRateLimitMetaData implements Serializable<Map<String,dynamic>>{
  final int? numRequestPerIPPerMin;
  final int? numRequestPerUserPerMin;
  final int? numRequestPerAPPPerMin;
  final int? numRequestPerOAuthTokenPerMin;

  const ExchangeRateLimitMetaData({
    this.numRequestPerIPPerMin,
    this.numRequestPerAPPPerMin,
    this.numRequestPerUserPerMin,
    this.numRequestPerOAuthTokenPerMin
  });
  factory ExchangeRateLimitMetaData.fromMap(Map<String,dynamic> map) => _$ExchangeRateLimitMetaDataFromJson(map);
  static ExchangeRateLimitMetaData fromJson(Map<String,dynamic> json) => ExchangeRateLimitMetaData.fromMap(json);
  static ExchangeRateLimitMetaData? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
  
  @override
  Map<String, dynamic> serialize([String? locale]) => _$ExchangeRateLimitMetaDataToJson(this);

  @override
  Map<String, dynamic> toJson() => serialize(null);
}

void exchangeVoidToVoidFunction<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
  void serialized, 
  InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
) {
  return;
}

ReturnType Function<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(FirstVarType i, InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings) convertToExchangeFormatApplicableFunc<ReturnType, FirstVarType>(ReturnType Function(FirstVarType firstVar) func){
  return <CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(
    FirstVarType i, 
    InteractiveSSOSharedSettings<CaptchaSerializedInfo, CaptchaInfo> sharedSettings
  ) => func(i);
}

class ExchangeFormat<Request, ResponseDataSuccess, ResponseDataFailed, RequestSerialized, ResponseDataSuccessSerialized, ResponseDataFailedSerialized>{
  final String exchangeProtocolName;
  final ExchangeHTTPMetaData httpMetaData;
  final ExchangeRateLimitMetaData rateLimitMetaData;
  final bool requireVerificationCode;
  final String? requiredVerificationCodeScope;
  
  final Request Function<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(RequestSerialized serialized, InteractiveSSOSharedSettings<CaptchaInfoSerialized,CaptchaInfo> sharedSettings) parseRequest;
  final RequestSerialized Function<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(Request req, InteractiveSSOSharedSettings<CaptchaInfoSerialized, CaptchaInfo> sharedSettings) serializeRequest;
  
  ///Validate Requests should return map key in the serialized request data structure that triggered the error
  ///If null is returned, it means the Request Object has passed the test.
  final List<String>? Function<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(Request req, InteractiveSSOSharedSettings<CaptchaInfoSerialized, CaptchaInfo> sharedSettings)? validateRequest;
  
  final ResponseDataSuccess Function(ResponseDataSuccessSerialized serialized, InteractiveSSOSharedSettings sharedSettings) parseSuccessResponseData;
  final ResponseDataFailed Function(ResponseDataFailedSerialized serialized, InteractiveSSOSharedSettings sharedSettings) parseFailedResponseData;
  final ResponseDataSuccessSerialized Function(ResponseDataSuccess data, InteractiveSSOSharedSettings sharedSettings) serializeSuccessResponseData;
  final ResponseDataFailedSerialized Function(ResponseDataFailed data, InteractiveSSOSharedSettings sharedSettings) serializeFailedResponseData;
  final bool Function<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(ResponseDataSuccess resDataSuccess, InteractiveSSOSharedSettings<CaptchaInfoSerialized, CaptchaInfo> sharedSettings)? validateResponseDataSuccess;
  final bool Function<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(ResponseDataFailed reqDataFailed, InteractiveSSOSharedSettings<CaptchaInfoSerialized, CaptchaInfo> sharedSettings)? validateResponseDataFailed;

  ExchangeFormat({
    required this.exchangeProtocolName,
    required this.httpMetaData,
    required this.rateLimitMetaData,
    required this.parseRequest,
    required this.serializeRequest,
    this.validateRequest,
    required this.parseSuccessResponseData,
    required this.parseFailedResponseData,
    required this.serializeSuccessResponseData,
    required this.serializeFailedResponseData,
    required this.requireVerificationCode,
    this.requiredVerificationCodeScope,
    this.validateResponseDataSuccess,
    this.validateResponseDataFailed
  });

  ExchangeResponse<ResponseDataSuccess, ResponseDataFailed> parseResponse<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>(
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaInfoSerialized,CaptchaInfo> sharedSettings 
  ) => ExchangeResponse.fromMap(
    map, 
    (ResponseDataSuccessSerialized serializedSucc) => parseSuccessResponseData(serializedSucc,sharedSettings), 
    (ResponseDataFailedSerialized serializedFail) => parseFailedResponseData(serializedFail,sharedSettings)
  );
  ExchangeResponse<ResponseDataSuccess, ResponseDataFailed> parseAndValidateResponse<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>
  (
    Map<String,dynamic> map,
    InteractiveSSOSharedSettings<CaptchaInfoSerialized,CaptchaInfo> sharedSettings
  ){
    var parsed = parseResponse(map, sharedSettings);
    if(validateResponseDataSuccess != null && parsed.data != null && !validateResponseDataSuccess!(parsed.data!, sharedSettings)){
      throw InnerParseException();
    }
    if(validateResponseDataFailed != null && parsed.failData != null && !validateResponseDataFailed!(parsed.failData!, sharedSettings)){
      throw InnerParseException();
    }
    return parsed;
  }
  
}