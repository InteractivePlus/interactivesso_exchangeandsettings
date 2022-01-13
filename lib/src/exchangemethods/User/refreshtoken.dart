import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/User/login.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';

InteractiveSSOExchangeFormat<ExchangeUserRefreshTokenRequiredRequest, UserLoginSuccessfulAPIResponseData, void, Map<String,dynamic>, Map<String,dynamic>, void> refreshUserTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'refreshUserTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/refreshed_token'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 2,
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ExchangeUserRefreshTokenRequiredRequest.staticDeserializeWithSettings, 
  serializeRequest: ExchangeUserRefreshTokenRequiredRequest.staticSerializeWithSettings, 
  parseSuccessResponseData: UserLoginSuccessfulAPIResponseData.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: UserLoginSuccessfulAPIResponseData.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);