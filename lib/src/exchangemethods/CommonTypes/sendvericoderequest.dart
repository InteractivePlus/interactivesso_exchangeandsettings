
import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'package:interactivesso_exchangeandsettings/src/interface/exchangeformat.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sendvericoderequest.g.dart';

@JsonSerializable(includeIfNull: false)
class ExchangeSendVericodeRequest {
  @JsonKey(name: 'preferred_method', fromJson: CommunicationMethod.fromJsonNullable, toJson: Serializable.convertToDynamicSerializedWithNullable)
  CommunicationMethod? preferredMethod;

  @JsonKey(name: 'force_preferred_method')
  bool forcePreferredMethod;

  ExchangeSendVericodeRequest({
    this.forcePreferredMethod = false,
    this.preferredMethod
  });
  factory ExchangeSendVericodeRequest.fromJson(Map<String,dynamic> json) => _$ExchangeSendVericodeRequestFromJson(json);

  static Map<String,dynamic> staticSerialize(ExchangeSendVericodeRequest req) => _$ExchangeSendVericodeRequestToJson(req);
  static ExchangeSendVericodeRequest staticDeserialize(Map<String,dynamic> serialized) => ExchangeSendVericodeRequest.fromJson(serialized);
  static void appendSerialize(Map<String,dynamic> toAppend, ExchangeSendVericodeRequest req){
    toAppend.addAll(staticSerialize(req));
  }
  static void appendDeserialize(ExchangeSendVericodeRequest toAppend, Map<String,dynamic> serialized){
    toAppend.forcePreferredMethod = serialized['force_preferred_method'] as bool? ?? false;
    toAppend.preferredMethod = CommunicationMethod.fromJsonNullable(serialized['preferred_method'] as String?);
  }
  static final staticSerializeWithSettings = ssoConvertToExchangeFormatFunc(staticSerialize);
  static final staticDeserializeWithSettings = ssoConvertToExchangeFormatFunc(staticDeserialize);
}