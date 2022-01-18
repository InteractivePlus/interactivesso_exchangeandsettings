class UserSystemSetting{
  final bool isUserGroupMutable;
  final bool isTokenSearchable;
  final bool isTokenMutable;

  ///Only present if the remote doesn't have ability to check token
  final Future<bool> Function(String userToken, String userUniqueId, int currentTime)? checkUserTokenLocal;
  final Future<bool> Function(String userRefreshToken, String userUniqueId, int currentTime)? checkUserRefreshTokenLocal;
  UserSystemSetting({
    required this.isUserGroupMutable,
    required this.isTokenSearchable,
    required this.isTokenMutable,
    this.checkUserTokenLocal,
    this.checkUserRefreshTokenLocal
  });
}