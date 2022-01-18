import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';

import '../CommonTypes/returnedtoken.dart';
import '../../interface/exchangeformat.dart';

InteractiveSSOExchangeFormat<ExchangeUserTokenRequiredRequest, void, void, Map<String,dynamic>, void, void> userLogoutAPI = InteractiveSSOExchangeFormat(
  exchangeProtocolName: 'userLogoutAPI',
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.DELETE, 
    successfulHTTPCode: 204, 
    possibleHTTPCodes: [204, 400, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: '/user/<user_unique_id>/<user_access_token>'
  ),
  rateLimitMetaData: const ExchangeRateLimitMetaData(),
  parseRequest: ExchangeUserTokenRequiredRequest.staticDeserializeWithSettings,
  serializeRequest: ExchangeUserTokenRequiredRequest.staticSerializeWithSettings,
  parseSuccessResponseData: ssoExchangeVoidToVoidFunc,
  parseFailedResponseData: ssoExchangeVoidToVoidFunc,
  serializeSuccessResponseData: ssoExchangeVoidToVoidFunc,
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc,
  requireVerificationCode: false
);