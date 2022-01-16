import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/exchangemethods/CommonTypes/returnedtoken.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'upload_avatar.g.dart';

@JsonSerializable()
class UploadAvatarRequest implements ExchangeUserTokenRequiredRequest{
  @JsonKey(required: true, name: 'user_access_token')
  @override
  String userAccessToken;

  @JsonKey(required: true, name: 'user_unique_id')
  @override
  String userUniqueId;
  
  @JsonKey(required: true, name: 'image_encoded')
  String imageEncodedBase64;

  UploadAvatarRequest({
    required this.userAccessToken,
    required this.userUniqueId,
    required this.imageEncodedBase64
  });

  factory UploadAvatarRequest.fromJson(Map<String,dynamic> json) => _$UploadAvatarRequestFromJson(json);
  Map<String,dynamic> toJson() => _$UploadAvatarRequestToJson(this);
  static Map<String,dynamic> staticSerialize(UploadAvatarRequest req) => req.toJson();
  static UploadAvatarRequest staticDeserialize(Map<String,dynamic> json) => UploadAvatarRequest.fromJson(json);
  static Set<String>? staticValidateWithSettings<FineSettting extends InteractiveSSOExchangeSharedSetting>(
    UploadAvatarRequest req,
    FineSettting sharedSettings
  ){
    Set<String> retList = {};
    var userTokenRst = ExchangeUserTokenRequiredRequest.validate(req);
    if(userTokenRst != null){
      retList.addAll(userTokenRst);
    }
    if(req.imageEncodedBase64.isEmpty || req.imageEncodedBase64.length > sharedSettings.settingBySystems.avatarSystemSetting.maxAvatarUploadSizeByte * 2){
      retList.add('image_encoded');
    }
    return retList.isEmpty ? null : retList;
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}

InteractiveSSOExchangeFormat<UploadAvatarRequest, AvatarInfo, void, Map<String,dynamic>, Map<String,dynamic>, void> uploadAvatarAPI = ExchangeFormat(
  exchangeProtocolName: 'uploadAvatarAPI', 
  httpMetaData: const ExchangeHTTPMetaData(
    method: ExchangeHTTPMethod.POST, 
    successfulHTTPCode: 200, 
    possibleHTTPCodes: [200, 400, 403, 409, 500], 
    relativePathWithParameterMarkedWithLtAndGtSymbols: 'avatars'), 
    rateLimitMetaData: const ExchangeRateLimitMetaData(
      numRequestPerUserPerMin: 2
    ), 
    parseRequest: UploadAvatarRequest.staticDeserializeWithSettings, 
    serializeRequest: UploadAvatarRequest.staticSerializeWithSettings, 
    validateRequest: UploadAvatarRequest.staticValidateWithSettings, 
    parseSuccessResponseData: ssoConvertToExchangeFormatFunc(AvatarInfo.fromJson), 
    parseFailedResponseData: ssoExchangeVoidToVoidFunc, 
    serializeSuccessResponseData: ssoConvertToExchangeFormatFunc((AvatarInfo info) => info.toJson()), 
    serializeFailedResponseData: ssoExchangeVoidToVoidFunc, 
    requireVerificationCode: false
);