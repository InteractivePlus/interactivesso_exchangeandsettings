
import 'package:interactivesso_datatypes/interactivesso_datatypes.dart';
import 'validatorsettings.dart';

class InteractiveSSOSharedSettings<CaptchaInfoSerialized, CaptchaInfo extends CaptchaSubmitInfo<CaptchaInfoSerialized>>{
  final CaptchaSubmitInfoSerializer<CaptchaInfoSerialized, CaptchaInfo> captchaInfoSerializer;
  final ValidatorSettings validatorSettings;
  final int? searchEntityOneTimeMaxNumber;

  InteractiveSSOSharedSettings({
    required this.captchaInfoSerializer,
    required this.validatorSettings,
    this.searchEntityOneTimeMaxNumber
  });
}