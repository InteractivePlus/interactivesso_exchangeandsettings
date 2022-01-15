import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/vericoderequiredrequest.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';

InteractiveSSOExchangeFormat<ExchangedVerificationCodeRequiredRequest,void,void,Map<String,dynamic>,void,void> verifyUserEmailAPI = ExchangeFormat(
  exchangeProtocolName: 'verifyUserEmailAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/verifyEmailResult'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 3,
    numRequestPerIPPerMin: 10
  ), 
  parseRequest: ExchangedVerificationCodeRequiredRequest.staticDeserializeWithSetting, 
  serializeRequest: ExchangedVerificationCodeRequiredRequest.staticSerializeWithSetting,
  validateRequest: ExchangedVerificationCodeRequiredRequest.validateWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: true,
  requiredVerificationCodeScope: 'verifyUserEmailAPI'
);