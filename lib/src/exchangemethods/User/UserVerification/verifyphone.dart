import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';

ExchangeFormat<ExchangedVerificationCodeRequiredRequest,void,void,Map<String,dynamic>,void,void> verifyUserPhoneAPI = ExchangeFormat(
  exchangeProtocolName: 'verifyUserPhoneAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<vericode_user_unique_id>/verifyPhoneResult'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 3,
    numRequestPerIPPerMin: 10
  ), 
  parseRequest: ExchangedVerificationCodeRequiredRequest.staticDeserializeWithSetting, 
  serializeRequest: ExchangedVerificationCodeRequiredRequest.staticSerializeWithSetting,
  validateRequest: ExchangedVerificationCodeRequiredRequest.validateWithSetting, 
  parseSuccessResponseData: exchangeVoidToVoidFunction, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: exchangeVoidToVoidFunction, 
  serializeFailedResponseData: exchangeVoidToVoidFunction, 
  requireVerificationCode: true,
  requiredVerificationCodeScope: 'verifyUserPhoneAPI'
);