import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';

import '../CommonTypes/returnedtoken.dart';
import '../CommonTypes/returneduserentity.dart';
import '../../interface/exchangeformat.dart';

InteractiveSSOExchangeFormat<ExchangeUserTokenRequiredRequest, ExchangedUserEntity, void, Map<String,dynamic>, Map<String,dynamic>, void> verifyUserTokenAPI = ExchangeFormat(
  exchangeProtocolName: 'verifyUserTokenAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/token/<user_access_token>/validateResult'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 20,
    numRequestPerUserPerMin: 10
  ), 
  parseRequest: ExchangeUserTokenRequiredRequest.staticDeserializeWithSettings, 
  serializeRequest: ExchangeUserTokenRequiredRequest.staticSerializeWithSettings, 
  parseSuccessResponseData: ExchangedUserEntity.staticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ExchangedUserEntity.staticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);