class User{
  String _firstName;
  String _lastName;
  String _emailAddress;
  String _phoneNumber;
  String _password;

  User(
      this._firstName,
      this._lastName,
      this._emailAddress,
      this._phoneNumber,
      this._password,
      );
  // ignore: unnecessary_getters_setters
  String get password => _password;

  set password(String value) {
    _password = value;
  }

  // ignore: unnecessary_getters_setters
  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  // ignore: unnecessary_getters_setters
  String get emailAddress => _emailAddress;

  set emailAddress(String value) {
    _emailAddress = value;
  }

  // ignore: unnecessary_getters_setters
  String get lastName => _lastName;

  set lastName(String value) {
    _lastName = value;
  }

  // ignore: unnecessary_getters_setters
  String get firstName => _firstName;

  set firstName(String value) {
    _firstName = value;
  }
}