
import 'package:interactiveplus_exchangeformat/interactiveplus_exchangeformat.dart';
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/sharedsettings.dart';
import 'package:json_annotation/json_annotation.dart';

typedef InteractiveSSOExchangeSharedSetting = InteractiveSSOSharedSettings<dynamic, Serializable<dynamic>>;

typedef InteractiveSSOExchangeFormat<Request, ResponseDataSuccessful, ResponseDataFailed, RequestSerialized, ResponseDataSuccessfulSerialized, ResponseDataFailedSerialized> = ExchangeFormat<Request, ResponseDataSuccessful, ResponseDataFailed, RequestSerialized, ResponseDataSuccessfulSerialized, ResponseDataFailedSerialized, InteractiveSSOExchangeSharedSetting>;
void ssoExchangeVoidToVoidFunc<FineSettingType extends InteractiveSSOExchangeSharedSetting>(void obj, InteractiveSSOSharedSettings settings){
  return;
}
ReturnType Function<FineSettingType extends InteractiveSSOExchangeSharedSetting>(FirstVarType i, FineSettingType sharedSettings) ssoConvertToExchangeFormatFunc<ReturnType, FirstVarType, SettingType>(ReturnType Function(FirstVarType firstVar) func){
  return <FineSettingType extends InteractiveSSOExchangeSharedSetting>(
    FirstVarType i, 
    FineSettingType sharedSettings
  ) => func(i);
}

class InternationalizedExchangeRequest{
  @JsonKey(name: 'preferred_locale')
  String? preferredLocale;

  InternationalizedExchangeRequest();
  static Map<String,dynamic> staticSerialize(InternationalizedExchangeRequest o){
    return o.preferredLocale == null ? {} : {
      'preferred_locale': o.preferredLocale
    };
  }
  static InternationalizedExchangeRequest staticDeserialize(Map<String,dynamic> serialized) => InternationalizedExchangeRequest()..preferredLocale = serialized['preferred_locale'] as String?;
  static void staticAppendSerialize(Map<String,dynamic> map, InternationalizedExchangeRequest o){
    Map<String,dynamic> oS = staticSerialize(o);
    map.addAll(oS);
  }
  static void staticAppendDeserialize(Map<String,dynamic> map, InternationalizedExchangeRequest o){
    o.preferredLocale = map['preferred_locale'] as String?;
  }
  static List<String>? validate(InternationalizedExchangeRequest o){
    return null;
  }
  static final validateWithSettings = ssoConvertToExchangeFormatFunc(validate);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}