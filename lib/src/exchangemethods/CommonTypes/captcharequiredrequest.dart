import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';

import '../../interface/exchangeformat.dart';

class ExchangeCaptchaRequiredRequest<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>{
  CaptchaInfo captchaInfo;

  ExchangeCaptchaRequiredRequest({required this.captchaInfo});

  static Map<String,dynamic> serialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>
  (
    ExchangeCaptchaRequiredRequest<CaptchaSerializedInfo, CaptchaInfo> request, 
    CaptchaSubmitInfoSerializer<CaptchaSerializedInfo, CaptchaInfo> serializer
  ){
    return {
      'captcha_info': serializer.serialize(request.captchaInfo)
    };
  }
  static Map<String,dynamic> serializeWithSetting<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ExchangeCaptchaRequiredRequest request, 
    FineSetting sharedSettings
  ) => serialize(request, sharedSettings.captchaInfoSerializer);
  
  static void appendSerializeWithSetting<FineSetting extends InteractiveSSOExchangeSharedSetting>
  (
    Map<String,dynamic> toAppend, 
    ExchangeCaptchaRequiredRequest request, 
    FineSetting sharedSettings
  ){
    var serialized = serializeWithSetting(request, sharedSettings);
    toAppend.addAll(serialized);
  }
  
  static ExchangeCaptchaRequiredRequest deserializeWithSetting<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    Map<String,dynamic> map, 
    FineSetting sharedSettings
  ){
    return ExchangeCaptchaRequiredRequest(captchaInfo: sharedSettings.captchaInfoSerializer.fromDynamicSerialized(map['captcha_info']));
  }
}
