
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../interface/exchangeformat.dart';

part 'sendvericoderequest.g.dart';

@JsonSerializable(includeIfNull: false)
class ExchangeSendVericodeWithPreferredMethodRequest {
  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? preferredMethod;

  @JsonKey(name: 'force_preferred_method')
  bool forcePreferredMethod;

  ExchangeSendVericodeWithPreferredMethodRequest({
    this.forcePreferredMethod = false,
    this.preferredMethod
  });
  factory ExchangeSendVericodeWithPreferredMethodRequest.fromJson(Map<String,dynamic> json) => _$ExchangeSendVericodeWithPreferredMethodRequestFromJson(json);

  static Map<String,dynamic> staticSerialize(ExchangeSendVericodeWithPreferredMethodRequest req) => _$ExchangeSendVericodeWithPreferredMethodRequestToJson(req);
  static ExchangeSendVericodeWithPreferredMethodRequest staticDeserialize(Map<String,dynamic> serialized) => ExchangeSendVericodeWithPreferredMethodRequest.fromJson(serialized);
  static void appendSerialize(Map<String,dynamic> toAppend, ExchangeSendVericodeWithPreferredMethodRequest req){
    toAppend.addAll(staticSerialize(req));
  }
  static void appendDeserialize(ExchangeSendVericodeWithPreferredMethodRequest toAppend, Map<String,dynamic> serialized){
    toAppend.forcePreferredMethod = serialized['force_preferred_method'] as bool? ?? false;
    toAppend.preferredMethod = CommunicationMethod.fromJsonNullable(serialized['preferred_method'] as String?);
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}