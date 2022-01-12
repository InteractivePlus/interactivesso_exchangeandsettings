import 'package:interactiveplus_shared_dart/interactiveplus_shared_dart.dart';
import 'package:json_annotation/json_annotation.dart';

import 'validatorsbysystem/appsystem.dart';
import 'validatorsbysystem/usersystem.dart';

part 'validatorsettings.g.dart';

@JsonSerializable()
class ValidatorSettings implements Serializable<Map<String,dynamic>>{
  final AppSystemValidators appSystemValidators;
  final UserSystemValidators userSystemValidators;

  @override
  Map<String,dynamic> serialize([String? locale]) => _$ValidatorSettingsToJson(this);

  @override
  Map<String,dynamic> toJson() => serialize(null);

  ValidatorSettings({required this.appSystemValidators, required this.userSystemValidators});
  factory ValidatorSettings.fromMap(Map<String,dynamic> map) => _$ValidatorSettingsFromJson(map);
  static ValidatorSettings fromJson(Map<String,dynamic> json) => ValidatorSettings.fromMap(json);
  static ValidatorSettings? fromJsonNullable(Map<String,dynamic>? json) => json == null ? null : fromJson(json);
}