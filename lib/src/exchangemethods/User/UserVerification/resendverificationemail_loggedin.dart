import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';

ExchangeFormat<ExchangeUserTokenRequiredRequest, void, void, Map<String,dynamic>, void, void> resendVerificationEmail_LoggedIn_API = ExchangeFormat(
  exchangeProtocolName: 'resendVerificationEmail_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/loggedin_verification_email'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ExchangeUserTokenRequiredRequest.staticDeserialize, 
  serializeRequest: ExchangeUserTokenRequiredRequest.staticSerialize, 
  parseSuccessResponseData: exchangeVoidToVoidFunction, 
  parseFailedResponseData: exchangeVoidToVoidFunction, 
  serializeSuccessResponseData: exchangeVoidToVoidFunction, 
  serializeFailedResponseData: exchangeVoidToVoidFunction, 
  requireVerificationCode: false
);