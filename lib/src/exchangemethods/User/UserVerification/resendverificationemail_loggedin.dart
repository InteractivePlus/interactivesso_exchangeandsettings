import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';

import '../../CommonTypes/returnedtoken.dart';
import '../../../interface/exchangeformat.dart';

InteractiveSSOExchangeFormat<ExchangeUserTokenRequiredRequest, void, void, Map<String,dynamic>, void, void> resendVerificationEmail_LoggedIn_API = InteractiveSSOExchangeFormat(
  exchangeProtocolName: 'resendVerificationEmail_LoggedIn_API', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 201, 
    possibleHTTPCodes: [201, 400, 403], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/verification_messages/loggedin_verification_email'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerIPPerMin: 5,
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: ExchangeUserTokenRequiredRequest.staticDeserializeWithSettings, 
  serializeRequest: ExchangeUserTokenRequiredRequest.staticSerializeWithSettings, 
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);