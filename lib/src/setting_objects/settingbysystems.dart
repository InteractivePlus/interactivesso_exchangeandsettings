import 'settingsbysystem/appsystemsetting.dart';
import 'settingsbysystem/avatarsystemsetting.dart';
import 'settingsbysystem/usersystemsetting.dart';

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