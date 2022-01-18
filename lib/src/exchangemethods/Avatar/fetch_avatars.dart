import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

import '../CommonTypes/returnedtoken.dart';
import '../CommonTypes/searchresults.dart';
import '../../interface/exchangeformat.dart';

part 'fetch_avatars.g.dart';

@JsonSerializable()
class FetchAvatarsRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;

  @JsonKey(required:  true, name: 'avatar_hashes')
  List<String> avatarHashes;

  FetchAvatarsRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    required this.avatarHashes
  });

  factory FetchAvatarsRequest.fromJson(Map<String,dynamic> json) => _$FetchAvatarsRequestFromJson(json);
  Map<String,dynamic> toJson() => _$FetchAvatarsRequestToJson(this);

  static Map<String,dynamic> staticSerialize(FetchAvatarsRequest req) => req.toJson();
  static FetchAvatarsRequest staticDeserialize(Map<String,dynamic> serialized) => FetchAvatarsRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? staticValidateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    FetchAvatarsRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(sharedSettings.searchEntityOneTimeMaxNumber != null && req.avatarHashes.length > sharedSettings.searchEntityOneTimeMaxNumber!){
      retList.add('avatar_hashes');
    }
    return retList;
  } 
}

InteractiveSSOExchangeFormat<FetchAvatarsRequest, ExchangeSearchAvatarResult, void, Map<String,dynamic>, Map<String,dynamic>, void> fetchAvatarsAPI = ExchangeFormat(
  exchangeProtocolName: 'fetchAvatarsAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.GET, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'avatars'
  ), 
  rateLimitMetaData: const ExchangeRateLimitMetaData(
    numRequestPerUserPerMin: 1
  ), 
  parseRequest: FetchAvatarsRequest.staticDeserializeWithSettings, 
  serializeRequest: FetchAvatarsRequest.staticSerializeWithSettings, 
  validateRequest: FetchAvatarsRequest.staticValidateWithSettings, 
  parseSuccessResponseData: exchangeSearchAvatarResultStaticDeserializeWithSettings, 
  parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
  serializeSuccessResponseData: exchangeSearchAvatarResultStaticSerializeWithSettings, 
  serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
  requireVerificationCode: false
);