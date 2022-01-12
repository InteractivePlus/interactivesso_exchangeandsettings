import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';

class CaptchaRequiredRequest<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>{
  CaptchaInfo captchaInfo;

  CaptchaRequiredRequest({required this.captchaInfo});

  static Map<String,dynamic> serialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(CaptchaRequiredRequest<CaptchaSerializedInfo, CaptchaInfo> request, CaptchaSubmitInfoSerializer<CaptchaSerializedInfo, CaptchaInfo> serializer){
    return {
      'captcha_info': serializer.serialize(request.captchaInfo)
    };
  }
  static void appendSerialize<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(Map<String,dynamic> toAppend, CaptchaRequiredRequest<CaptchaSerializedInfo, CaptchaInfo> request, CaptchaSubmitInfoSerializer<CaptchaSerializedInfo, CaptchaInfo> serializer){
    toAppend['captcha_info'] = serializer.serialize(request.captchaInfo);
  }
  static CaptchaInfo fromMap<CaptchaSerializedInfo,CaptchaInfo extends CaptchaSubmitInfo<CaptchaSerializedInfo>>(Map<String,dynamic> map, CaptchaSubmitInfoSerializer<CaptchaSerializedInfo, CaptchaInfo> serializer){
    if(map['captcha_info'] != null && map['captcha_info'] is CaptchaSerializedInfo){
      return serializer.fromSerialized(map['captcha_info']);
    }else{
      throw InteractivePlusSystemException.SERIALIZATION_EXCEPTION;
    }
  }
}