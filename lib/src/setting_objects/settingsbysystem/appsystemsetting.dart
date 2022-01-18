class APPSystemSetting{
  final bool isAppGroupMutable;
  final bool isOAuthTokenSearchable;
  final bool isOAuthTokenMutable;

  ///Only present if the remote doesn't have ability to check token
  final Future<bool> Function(String oAuthToken, String userUniqueId, String appClientId, int currentTime)? checkOAuthTokenLocal;
  final Future<bool> Function(String oAuthRefreshToken, String userUniqueId, String appClientId, int currentTime)? checkOAuthRefreshTokenLocal;
  APPSystemSetting({
    required this.isAppGroupMutable,
    required this.isOAuthTokenSearchable,
    required this.isOAuthTokenMutable,
    this.checkOAuthTokenLocal,
    this.checkOAuthRefreshTokenLocal
  });
}