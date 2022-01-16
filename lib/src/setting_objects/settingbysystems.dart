import 'package:interactivesso_exchangeandsettings/src/setting_objects/settingsbysystem/appsystemsetting.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/settingsbysystem/avatarsystemsetting.dart';
import 'package:interactivesso_exchangeandsettings/src/setting_objects/settingsbysystem/usersystemsetting.dart';

class SettingBySystems{
  final UserSystemSetting userSystemSetting;
  final APPSystemSetting appSystemSetting;
  final AvatarSystemSetting avatarSystemSetting;
  SettingBySystems({
    required this.userSystemSetting,
    required this.appSystemSetting,
    required this.avatarSystemSetting
  });
}