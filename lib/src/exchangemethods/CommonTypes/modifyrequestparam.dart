
import 'package:json_annotation/json_annotation.dart';

part 'modifyrequestparam.g.dart';

abstract class ModifyRequestParamItem<T>{
  bool changeValue;
  T? value;
  validate();
  ModifyRequestParamItem({required this.changeValue, required this.value});
}

@JsonSerializable()
class ModifyRequestParamItemString implements ModifyRequestParamItem<String?>{
  @override
  bool changeValue;

  @override
  String? value;

  @override
  bool validate() => changeValue == false || value != null;
  
  ModifyRequestParamItemString({required this.changeValue, required this.value});
  factory ModifyRequestParamItemString.fromJson(Map<String,dynamic> json) => _$ModifyRequestParamItemStringFromJson(json);

  Map<String,dynamic> toJson() => _$ModifyRequestParamItemStringToJson(this);
}

@JsonSerializable()
class ModifyRequestParamItemStringNullable implements ModifyRequestParamItem<String>{
  @override
  bool changeValue;

  @override
  String? value;

  @override
  bool validate() => true;
  
  ModifyRequestParamItemStringNullable({required this.changeValue, required this.value});
  factory ModifyRequestParamItemStringNullable.fromJson(Map<String,dynamic> json) => _$ModifyRequestParamItemStringNullableFromJson(json);

  Map<String,dynamic> toJson() => _$ModifyRequestParamItemStringNullableToJson(this);
}