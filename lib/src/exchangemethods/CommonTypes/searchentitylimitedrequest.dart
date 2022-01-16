
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'searchentitylimitedrequest.g.dart';

@JsonSerializable(includeIfNull: false)
class ExchangeSearchEntityLimitedRequest{
  @JsonKey(name: 'search_offset')
  int searchOffset;

  @JsonKey(name: 'search_limit')
  int? searchLimit;

  ExchangeSearchEntityLimitedRequest({this.searchOffset = 0, this.searchLimit});
  factory ExchangeSearchEntityLimitedRequest.fromJson(Map<String,dynamic> json) => _$ExchangeSearchEntityLimitedRequestFromJson(json);
  static Map<String,dynamic> staticSerialize(ExchangeSearchEntityLimitedRequest req) => _$ExchangeSearchEntityLimitedRequestToJson(req);
  static ExchangeSearchEntityLimitedRequest staticDeserialize(Map<String,dynamic> serialized) => ExchangeSearchEntityLimitedRequest.fromJson(serialized);
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
  static Set<String>? validateWithSettings<FineSetting extends InteractiveSSOExchangeSharedSetting>(
    ExchangeSearchEntityLimitedRequest req,
    FineSetting sharedSettings
  ){
    Set<String> retList = {};
    if(req.searchOffset < 0){
      retList.add('search_offset');
    }
    if(
      (req.searchLimit != null && req.searchLimit! <= 0) 
      || (
        sharedSettings.searchEntityOneTimeMaxNumber != null &&
        (
          req.searchLimit == null
          || req.searchLimit! > sharedSettings.searchEntityOneTimeMaxNumber!
        )
      )
    ){
      retList.add('search_limit');
    }
    return retList.isEmpty ? null : retList;
  }
}