abstract class IAuthGenerator {
  String basic(
      {String? username, String? password, required String? previousData});
  String bearer(String token);
  String oAuth1();
  String jwt();
  String aws();
}

class AuthGenerator extends IAuthGenerator {
  @override
  String aws() {
    // TODO: implement aws
    throw UnimplementedError();
  }

  @override
  String basic(
      {String? username, String? password, required String? previousData}) {
    ///convert username and password to [username:password] string
    final temp =
        (previousData != null && previousData != '' ? previousData : ':')
            .split(':');
    String usernameTemp = username ?? temp.first;
    String passwordTemp = password ?? temp.last;
    return '$usernameTemp:$passwordTemp';
  }

  @override
  String bearer(String token) {
    return token;
  }

  @override
  String jwt() {
    // TODO: implement jwt
    throw UnimplementedError();
  }

  @override
  String oAuth1() {
    // TODO: implement oAuth1
    throw UnimplementedError();
  }
}
